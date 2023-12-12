<?php
    $server_name = "localhost";
    $username = "root";
    $password = "";
    $dbname = "cst499_ben";
    $port = "3306";
    $conn=mysqli_connect($server_name,$username,$password,"$dbname");
    if(!$conn)
        {
          die("Connection failed: " . $conn->connect_error);
        }
?>