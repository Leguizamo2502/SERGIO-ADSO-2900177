<?php
class Connection
{
    public $host = 'localhost';
    public $dbname = 'practica';
    public $port = '5432';
    public $user = 'soporte';
    public $password = '123456';
    public $driver = 'pgsql';
    public $connect;

    public static function getConnection()
    {
        try {
            $connection = new Connection();
            $connection->connect = new PDO("{$connection->driver}:host={$connection->host}; 
            port={$connection->port}; 
            dbname={$connection->dbname}; 
            user={$connection->user}; 
            password={$connection->password}");
            $connection->connect->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            return $connection->connect;
            // echo 'connection succes';
        } catch (PDOException $e) {
            echo "Error: " . $e->getMessage();
        }
    }
}

// Connection::getConnection();
