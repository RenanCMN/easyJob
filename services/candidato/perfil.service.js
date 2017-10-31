app.service('PerfilService', function($http){

  this.httpGet = function(url){
    return $http({
        method : "GET",
        url : url
    }).then(function(response) {
      return response.data;
    }).catch(function(response){
      return response;
    });
  }

});
