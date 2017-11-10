app.controller('SiteController', function($scope, SiteService, AlertService){
  $scope.cadastrarUsuario = function(){
    let params = $scope.pessoa;
    if(params.usuario != params.senha){
      if (params.senha.length >= 6) {
        if(params.senha === params.confirmaSenha){
          SiteService.insertUser(params)
          .then(function(res){
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
    }else{
      AlertService.errorModal('Usuário e Senha devem ser diferentes.');
    }
  };

  $scope.loginUser = function(){
    SiteService.login($scope.login)
    .then(function(response){
      console.log(response);
    });
  }
});
