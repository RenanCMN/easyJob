<?php

  require_once '../connectionDB.php';
  require_once '../functions.php';

  $data = json_decode(file_get_contents("php://input"));

  $db = new ConnectionDB();
  $con = $db->getConnection();

  if(isset($data) && !empty($data)){
    $param = $db->decodeHash($data->TOKEN);

    //busca o usuário
    $query = "SELECT CODPESSOA, EMAIL, USUARIO, TIPOUSUARIO FROM PESSOA WHERE USUARIO = '{$param[1]}' AND EMAIL = '{$param[2]}'";

    $stmt = $con->prepare($query);
    $stmt->execute();

    if($stmt->rowCount() > 0){
      $result = $stmt->fetch(PDO::FETCH_ASSOC);

      echo '{"STATUS": true, "TIPOUSUARIO": '.$result['TIPOUSUARIO'].' }';

    }else{
      echo '{"STATUS": false, "MESSAGE": "Usuário ou senha inválidos."}';
    }
  }
