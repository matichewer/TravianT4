-- Migraciones de esquema para servidores YA INSTALADOS.
--
-- Una instalacion desde cero NO necesita este archivo: install/data/config.sql
-- ya crea todas las columnas. Esto es solo para bases creadas antes de que
-- cada columna existiera.
--
-- Todo es idempotente (ADD COLUMN IF NOT EXISTS), asi que se puede correr
-- entero las veces que haga falta sin romper nada ni pisar valores.
--
-- Uso:
--   docker compose exec -T db mariadb -utravian -p<password> travian_t4 < tools/migrations.sql
--
-- El password sale de .env (MARIADB_PASSWORD) o de config/connection.php.
-- Si el prefijo de tablas no es s1_, ajustar los nombres.

-- 2026-07-20 - Tienda de oro con PayPal (commit 108b699)
-- Oculta la tienda PayPal/Liberty Reserve, que no tiene procesador real detras.
-- 0 = oculta, 1 = visible.
ALTER TABLE s1_config
  ADD COLUMN IF NOT EXISTS paypal_gold int(1) NOT NULL DEFAULT 0;

-- 2026-07-20 - Tope de medallas semanales (commit ddf08b3)
-- Cuantos puestos de cada ranking semanal reciben medalla, de 1 a 10.
-- En un servidor chico conviene 1, asi solo se premia al ganador.
ALTER TABLE s1_config
  ADD COLUMN IF NOT EXISTS medal_top int(2) NOT NULL DEFAULT 10,
  ADD COLUMN IF NOT EXISTS medal_ally_top int(2) NOT NULL DEFAULT 10;

-- 2026-07-22 - Sesiones simultaneas en varios dispositivos
-- Conserva hasta 20 tokens de sesion independientes por cuenta.
ALTER TABLE s1_users
  MODIFY COLUMN sessid varchar(2048) NOT NULL;
