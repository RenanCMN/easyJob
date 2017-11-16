app.service('SiteService', function($http, CONFIG){
  this.insertUser = function(params){
    return $http({

        method: "POST",
        url : CONFIG.urlLocalHost+'site/cadastro.php',
        data: params,
        headers: CONFIG.headers

    }).then(function(response) {
      return response.data;
    }).catch(function(response){
      return response;
    });
  }
});
