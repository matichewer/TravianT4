#!/bin/bash
#
# Resetea el servidor por completo para empezar una partida nueva.
#
# Destruye la base de datos entera (aldeas, tropas, mensajes, cuentas) y deja
# el proyecto listo para correr el instalador web de nuevo. Todos los jugadores
# tienen que volver a registrarse.
#
# A diferencia de install/uninstall.php, este script NO borra config/config.php
# (que es codigo versionado, no configuracion generada) y destruye el volumen
# de datos en lugar de dropear tabla por tabla, asi no quedan restos.
#
# Uso:
#   ./reset_server.sh              # pide confirmacion, hace backup antes
#   ./reset_server.sh --no-backup  # saltea el backup
#
set -euo pipefail

cd "$(dirname "$0")"

BACKUP=1
[ "${1:-}" = "--no-backup" ] && BACKUP=0

echo "Esto BORRA la partida actual de forma irreversible:"
echo "  - todas las cuentas, aldeas, tropas, mensajes e informes"
echo "  - el volumen de datos de MariaDB (dbdata)"
echo "  - la instalacion actual (vas a tener que correr el instalador de nuevo)"
echo
read -r -p 'Escribi RESET para confirmar: ' answer
if [ "$answer" != "RESET" ]; then
    echo "Cancelado, no se toco nada."
    exit 1
fi

# Lee un define() de config/connection.php. Esa es la fuente de verdad del
# password: MARIADB_PASSWORD en .env solo se aplica cuando se crea el volumen
# por primera vez, asi que si despues se cambio, el .env miente.
php_define() {
    sed -n "s/.*define(\"$1\",[[:space:]]*\"\\(.*\\)\").*/\\1/p" config/connection.php 2>/dev/null | head -1
}

# Backup antes de destruir. Solo tiene sentido si la base esta levantada.
if [ "$BACKUP" = "1" ]; then
    if docker compose ps --status running --services 2>/dev/null | grep -qx db; then
        user="$(php_define SQL_USER)"
        password="$(php_define SQL_PASS)"
        db="$(php_define SQL_DB)"
        backup="backup-$(date +%Y%m%d-%H%M%S).sql"
        echo "Guardando backup de ${db:-?} en $backup ..."
        if [ -z "$user" ] || [ -z "$db" ]; then
            echo "AVISO: no pude leer las credenciales de config/connection.php."
            echo "Si igual queres seguir: ./reset_server.sh --no-backup"
            exit 1
        fi
        if docker compose exec -T db mariadb-dump -u"$user" -p"$password" \
                "$db" > "$backup" 2>/dev/null; then
            echo "Backup listo ($(du -h "$backup" | cut -f1))."
        else
            rm -f "$backup"
            echo "AVISO: el backup fallo. Cancelo por las dudas."
            echo "Si igual queres seguir: ./reset_server.sh --no-backup"
            exit 1
        fi
    else
        echo "La base no esta corriendo, sin backup."
    fi
fi

echo "Bajando los contenedores y destruyendo el volumen de datos ..."
docker compose down -v

echo "Limpiando marcadores de instalacion y de estado ..."
# Ambos estan en .gitignore: los regenera el instalador.
rm -f config/installed config/connection.php
# Marcadores de "esto ya se ejecuto" (entrega de medallas, etc). empty.txt
# esta versionado y tiene que quedar.
find GameEngine/Prevention -name '*.txt' ! -name 'empty.txt' -delete

echo "Levantando los contenedores ..."
docker compose up --build --detach

echo "Esperando a que la base este lista ..."
for _ in $(seq 1 60); do
    if docker compose ps db --format '{{.Health}}' 2>/dev/null | grep -q healthy; then
        break
    fi
    sleep 2
done

port="$(docker compose port web 80 2>/dev/null | cut -d: -f2)"
port="${port:-8080}"
host="$(hostname -I 2>/dev/null | awk '{print $1}')"
host="${host:-localhost}"

# Post-reset el volumen se recrea de cero, asi que el password que vale ahora
# SI es el de .env (MARIADB_PASSWORD solo se aplica al crear el volumen).
[ -f .env ] && . ./.env
password="${MARIADB_PASSWORD:-travian}"

cat <<EOF

================================================================
  Base reseteada. Falta la instalacion, que se hace en el navegador.
================================================================

PASO 1 - Abri el instalador

    http://$host:$port/install/

  Si no abre, probá con la IP de la Raspberry en tu red.
  El instalador tiene 7 pantallas: Inicio, Configuracion, Base de
  datos, Campo, Multihunter, Oasis y Fin. Hay que completarlas todas,
  en orden. No cierres el navegador a la mitad.

PASO 2 - Pantalla "Base de datos"

    Server:     db
    User:       travian
    Password:   $password
    Database:   travian_t4
    Prefix:     s1_
    Connection: MySQLi

  IMPORTANTE: el host es 'db', NO 'localhost'. Es el nombre del
  servicio en docker-compose.yml; desde el contenedor web
  'localhost' no llega a la base.

PASO 3 - Pantalla "Configuracion", seccion Options

  Para una partida chica entre amigos:

    Weekly medals - players (top):    1 - only the winner
    Weekly medals - alliances (top):  1 - only the winner
    Buy Gold with PayPal:             Disable

  El resto (velocidad, tamano del mapa, proteccion de novato) es
  a gusto. Anotate el nombre de admin y la password de multihunter
  que pongas, no se muestran despues.

PASO 4 - Pantalla "Campo"

  Genera el mapa entero. Tarda unos minutos en la Raspberry y parece
  colgado. Dejalo terminar.

PASO 5 - Cuando termine

  - Los jugadores entran a  http://$host:$port/  y se registran de
    nuevo. Las cuentas viejas ya no existen.
  - El panel de admin queda en  http://$host:$port/Admin/admin.php
  - /install/ se bloquea solo: existe config/installed y el
    instalador se niega a correr de nuevo.

AVISO SOBRE GIT

  El instalador reescribe config/config.php y config/connection.php.
  config.php esta versionado, asi que 'git status' lo va a mostrar
  modificado: es normal, pasa de plantilla a valores concretos.
  Revisalo antes de commitear y NO commitees config/connection.php,
  que tiene la password (ya esta en .gitignore).

  Si algo sale mal, el backup de arriba restaura la partida vieja:
    docker compose exec -T db mariadb -utravian -p<pass> travian_t4 < backup-XXXX.sql

EOF
