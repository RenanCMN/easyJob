app.controller('HomeController', function($scope, AlertService, GlobalFunctionService){
  console.log('controller home');

    $scope.botao1 = function(){
      AlertService.errorModal();
    };

    $scope.botao2 = function(){
      AlertService.warningModal();
    };

    $scope.botao3 = function(msg){
      AlertService.successModal(msg);
    };


});
