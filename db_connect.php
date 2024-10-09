<?php
$host = 'mysql'; // Nama service MySQL yang Anda definisikan di docker-compose
$dbname = 'global_master';
$username = 'root';
$password = 'your_password'; // Ganti dengan password yang sesuai

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Connected successfully";
} catch (PDOException $e) {
    die("Koneksi database gagal: " . $e->getMessage());
}
?>
