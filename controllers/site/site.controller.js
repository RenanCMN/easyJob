app.controller('SiteController', function($scope, $state, SiteService, AutenticacaoService, AlertService){
  if(!(localStorage.getItem('AUTO'))){
    localStorage.clear();
  }
  //LOGIN AUTOMATICO, caso tenha marcado a opção de 'Mantenha-me conectado'
  AutenticacaoService.autoLogin();

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
    AutenticacaoService.login($scope.login)
      .then(function(response){
        $(".modal-backdrop").remove(); //esconde a modal login
        if(response.STATUS){

          localStorage.setItem('TOKEN', response.TOKEN); //set hash on localStorage

          if(response.AUTO){
            localStorage.setItem('AUTO', response.AUTO);
          }

          if (response.TIPOUSUARIO == "1") {
            $state.go('menu.candidatoHome');
          }else if(response.TIPOUSUARIO == "2"){
            $state.go('menu.empresaHome');
          }else{
            $state.go('/');
          }

        }else {
          AlertService.errorModal(response.MESSAGE);
        }

    });
  }

});
