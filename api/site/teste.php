<?php
// class ConnectionDB{
//   private $conn;
//   public function __construct(){
//   try {
//        $con = new PDO("mysql:host=localhost;dbname=easyjobapi", "root", "");
//        $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
//        $con->exec("SET NAMES 'utf8'");
//        $this->conn = $con;
//
//      } catch (PDOException $e) {
//        echo "Erro ao conectar-se: ".$e->getMessage();
//      }
//    }
//
//    public function getConnection(){
//      return $this->conn;
//    }
//  }
//
//
// $con = new ConnectionDB();
// /*tabela teste so contem um coluna chamada id AUTO_INCREMENT e a coluna nome*/
// $stmt2 = $con->getConnection();
// $t = $stmt2->prepare("INSERT INTO teste (nome) VALUES ('MAX123')");
// $t->execute();
// $las_id = $stmt2->lastInsertId();
// var_dump($las_id);
require_once '../connectionDB.php';
$db = new ConnectionDB();
/*tabela teste so contem um coluna chamada id AUTO_INCREMENT e a coluna nome*/
$con = $db->getConnection();
$stmt = $con->prepare("INSERT INTO teste (nome) VALUES ('MAX123')");
$stmt->execute();
var_dump($con->lastInsertId());
