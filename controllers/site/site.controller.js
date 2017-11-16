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

                setTimeout(function(){

                  AlertService.loadingShow('Aguarde... Estou te redirecionando...');

                  setTimeout(function(){

                    let login = {
                      user : res.USER,
                      password : res.PASSWORD,
                      autoLogin : true //default após cadastro é ter o login AUTOMATICO
                    };
                    console.log(login);
                    AutenticacaoService.login(login);
                    AlertService.loadingClose();

                  }, 3000);

                }, 3000);

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
    AutenticacaoService.login($scope.login);
  }

});
