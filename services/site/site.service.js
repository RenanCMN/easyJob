app.service('SiteService', function($http, CONFIG){
  this.insertUser = function(params){
    return $http({
        method: "POST",
        url : CONFIG.urlLocalHost+'site/cadastro.php',
        data: params,
        headers:{'Content-Type' : 'application/x-www-form-urlencoded; charset=UTF-8'}
    }).then(function(response) {
      return response.data;
    }).catch(function(response){
      return response;
    });
  },
  this.login = function(params){
    return $http({
      method: "POST",
      url: CONFIG.urlLocalHost+'site/login.php',
      data: params,
      headers:{'Content-Type' : 'application/x-www-form-urlencoded; charset=UTF-8'}
    }).then(function(response){
      return response.data;
    }).catch(function(response){
      console.log(response);
      return response;
    });
  }
});
