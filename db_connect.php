<?php
$host = '127.0.0.1'; // Nama service MySQL di docker-compose
$dbname = 'global_master';
$DB_CONNECTION = 'mysql';
$username = 'root';
$password = 'your_password'; // Ganti dengan password yang aman

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname",$DB_CONNECTION $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Connected successfully";
} catch (PDOException $e) {
    die("Koneksi database gagal: " . $e->getMessage());
}
