app.service('AutenticacaoService', function($http, $location, $state, CONFIG, AlertService){

  this.login = function(params){
    return $http({
      method: "POST",
      url: CONFIG.urlLocalHost+'site/login.php',
      data: params,
      headers:CONFIG.headers,
    }).then(function(response){
      console.log(response.data);
      $(".modal-backdrop").remove(); //esconde a modal login

      if(response.data.STATUS){

        localStorage.setItem('TOKEN', response.data.TOKEN); //set hash on localStorage

        if(response.data.AUTO){
          localStorage.setItem('AUTO', response.data.AUTO);
        }

        if (response.data.TIPOUSUARIO == "1") {
          $state.go('menu.candidatoHome');
        }else if(response.data.TIPOUSUARIO == "2"){
          $state.go('menu.empresaHome');
        }else{
          $state.go('/');
        }

      }else {
        AlertService.errorModal(response.data.MESSAGE);
      }
    }).catch(function(response){
      return response;
    });
  },

  //terminar
  this.autenticacaoPagina = function(){
    let url = $location.absUrl();
    console.log(url);
  },

  this.autoLogin = function(){

    let token = {"TOKEN": localStorage.getItem('TOKEN')};

    if (localStorage.getItem('AUTO') == 'true') {
      $http({

        method: "POST",
        url: CONFIG.urlLocalHost+'site/autoLogin.php',
        data: token,
        headers: CONFIG.headers

      })
      .then(function(response){

        if (response.data.STATUS) {

          if (response.data.TIPOUSUARIO == 1) {
            $state.go('menu.candidatoHome');
          }else if(response.data.TIPOUSUARIO == 2){
            $state.go('menu.empresaHome');
          }else {
            $state.go('/');
          }

        }else{
          AlertService.errorModal('Problemas com a autenticação automática... XD')
        }

      })
      .catch(function(error){
        console.log(error);
      });
    }
  },

  this.getPermissions = function(){

    let params = {
      "TOKEN": localStorage.getItem('TOKEN'),
      "FUNCTION": "getListMenu"
    };

    return $http({

      method: "POST",
      url: CONFIG.urlLocalHost+'site/autenticacao.php',
      data: params,
      headers: CONFIG.headers

    })
    .then(function(response){
      return response.data;
    })
    .catch(function(error){
      $state.go('/');
      AlertService.errorModal('Faça o login, por gentileza... :)')
    });
  }

});
