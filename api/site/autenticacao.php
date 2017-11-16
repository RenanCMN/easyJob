<?php

require_once '../connectionDB.php';

$data = json_decode(file_get_contents("php://input"));

$db = new ConnectionDB();
$con = $db->getConnection();

if(isset($data) && !empty($data)){

  $decodedHash = $db->decodeHash($data->TOKEN);

  switch ($data->FUNCTION) {
    case 'getListMenu':

      $query = "SELECT I.* FROM pessoa_perfil PF ";
      $query .= "INNER JOIN permissoes P ON P.CODPERFIL = PF.CODPERFIL ";
      $query .= "INNER JOIN item I ON I.CODITEM = p.CODITEM ";
      $query .= "WHERE PF.CODPESSOA = {$decodedHash[0]}";

      $stmt = $con->prepare($query);
      $stmt->execute();

      $permissoes = $stmt->fetchAll(PDO::FETCH_ASSOC);
  
      echo json_encode($permissoes);
      break;

    default:

      echo '{"STATUS": false, "MESSAGE": "Erro ao obter as permissões."}';
      break;
  }

}
