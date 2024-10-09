#!/bin/bash
set -e

# Tunggu MySQL
echo "Waiting for MySQL..."
until mysql -h mysql -u "${DB_USER}" -p"${DB_PASSWORD}" -e "SELECT 1" >/dev/null 2>&1; do
    echo "MySQL is unavailable - sleeping"
    sleep 1
done
echo "MySQL is up!"

# Update PHP configuration
cat > /var/www/html/db.connect.php << EOL
<?php
\$host = 'mysql';
\$dbname = '${DB_NAME}';
\$username = '${DB_USER}';
\$password = '${DB_PASSWORD}';

try {
    \$pdo = new PDO("mysql:host=\$host;dbname=\$dbname", \$username, \$password);
    \$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException \$e) {
    die("Koneksi database gagal: " . \$e->getMessage());
}
EOL

# Start Apache
apache2-foreground
