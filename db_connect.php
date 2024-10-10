<?php
$host = '172.29.208.1'; 
$dbname = 'global_master';
$username = 'root';
$password = 'your_password'; 

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  
} catch (PDOException $e) {
    die("Koneksi database gagal: " . $e->getMessage());
}
?>
