app.controller('PerfilController', function($scope, PerfilService, AlertService){
  //fazer busca de CEP no global-function e chamar aqui
  $scope.buscaCep = function(param){
    var data = PerfilService.httpGet(`https://viacep.com.br/ws/${param}/json`)
    .then(function(data){
      console.log(data);
      $scope.logradouro = data.logradouro; //rua
      $scope.complemento = data.complemento || 'Não consta';
      $scope.numero = data.numero;
      $scope.bairro = data.bairro;
      $scope.cidade = data.localidade; //cidade
      $scope.uf = data.uf; //estado
    });
  };

  $scope.saveProfile = function(){
    AlertService.successModal('Dados do perfil atualizados com sucesso!');
  };
});
