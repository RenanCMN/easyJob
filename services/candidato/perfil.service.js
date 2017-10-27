app.service('PerfilService', function($http){

  this.httpGet = function(url){
    $http({
      method : "GET",
      url : url
    }).then(function mySuccess(response) {
      console.log(response.data);
      console.log(response);
    });

  }
});
