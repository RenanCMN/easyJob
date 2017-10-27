app.controller('PerfilController', function($scope, PerfilService){
  //fazer busca de CEP no global-function e chamar aqui
  $scope.buscaCep = function(param){
    PerfilService.httpGet(`https://viacep.com.br/ws/${param}/json`);
  }
});
