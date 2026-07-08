-- Crear las bases de datos para cada microservicio
CREATE DATABASE IF NOT EXISTS ventas_db;
CREATE DATABASE IF NOT EXISTS despachos_db;

-- Otorgar privilegios si es necesario
GRANT ALL PRIVILEGES ON ventas_db.* TO 'dbuser'@'%';
GRANT ALL PRIVILEGES ON despachos_db.* TO 'dbuser'@'%';
FLUSH PRIVILEGES;
