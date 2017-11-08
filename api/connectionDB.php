<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
/**
 * Esta classe instancia a conexão com o banco de dados MySql
 * e retorna a conexão na função getConnection()
 */
class ConnectionDB{
 private function setConnection(){
   try {
     $con = new PDO("mysql:host=localhost;dbname=easyjobapi", "root", "");
     $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
     $con->exec("SET NAMES 'utf8'");
     return $con;
   } catch (PDOException $e) {
     echo "Erro ao conectar-se: ".$e->getMessage();
   }
 }
 public function getConnection(){
   return $this->setConnection();
 }
}
