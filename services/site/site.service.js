app.service('SiteService', function($http){

  this.insertUser = function(params){
    return $http({
        method: "POST",
        url : config.urlLocalHost,
        data: data,
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
      url: config.urlLocalHost,
      data: data,
      headers:{'Content-Type' : 'application/x-www-form-urlencoded; charset=UTF-8'}
    }).then(function(response){
      return response.data;
    }).catch(function(response){
      console.log(response);
      return response;
    });
  }
});
