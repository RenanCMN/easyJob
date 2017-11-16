app.controller('MenuController', function($scope, AutenticacaoService, GlobalFunctionService){

  AutenticacaoService.getPermissions()
    .then(function(res){
      $scope.menu = res;
    });

});
