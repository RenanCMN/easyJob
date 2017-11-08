<?php

require_once '../connectionDB.php';

$data = json_decode(file_get_contents("php://input"));

$con = new ConnectionDB();

if(isset($data) && !empty($data)){
  $query1 = "SELECT CODPESSOA FROM PESSOA WHERE USUARIO = '{$data->usuario}' OR EMAIL = '{$data->email}'";
  $stmt = $con->getConnection()->prepare($query1);
  $stmt->execute();
  if($stmt->rowCount() > 0){
    $msg  = "<p>Possíveis problemas: </p>";
    $msg .= "<p>- Usuário já existente</p>";
    $msg .= "<p>- E-mail já em uso</p>";
    echo '{"STATUS": false, "MESSAGE": "'.$msg.'"}';
  }else{
    if($data->senha == $data->confirmaSenha){
      $query2 = "INSERT INTO PESSOA (NOME, EMAIL, USUARIO, SENHA) ";
      $query2 .= "VALUES ('{$data->nome}', '{$data->email}', '{$data->usuario}', md5('{$data->senha}'))";
      $stmt = $con->getConnection()->prepare($query2);
      $stmt->execute();
      if($stmt->rowCount() > 0){
        echo '{"STATUS": true, "MESSAGE": "Cadastrado com sucesso!"}';
      }else{
        echo '{"STATUS": false, "MESSAGE": "Erro ao cadastrar"}';
      }
    }else{
      echo '{"STATUS": false, "MESSAGE": "Campos senha e confirma senha, devem ser iguais."}';
    }

  }
}else{
  echo '{"STATUS": false, "MESSAGE": "Problemas com a integração com API."}';
}
