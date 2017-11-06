app.controller('SiteController', function($scope, SiteService, AlertService){
  $scope.cadastrarUsuario = function(){
    let params = $scope.pessoa;
    if (params.senha.length >= 6) {
      if(params.senha === params.confirmaSenha){
        SiteService.insertUser('http://localhost/easyjob/api/site/cadastro.php', params)
        .then(function(res){
          console.log(res);
          let html = res.MESSAGE;
          if(res.STATUS){
            AlertService.successModal(html);
          }else{
            AlertService.errorModal(html);
          }
        });
      }else{
        AlertService.errorModal('Campos senha e confirma senha devem ser iguais.');
      }
    }else{
      AlertService.errorModal('Senha deve conter no mínimo 6 digitos.');
    }
  };
});
