app.service('SiteService', function($http){
  this.insertUser = function(url, params){
    let data = params || ''
    return $http({
        method : "POST",
        url : url,
        data: data,
        headers:{'Content-Type' : 'application/x-www-form-urlencoded; charset=UTF-8'}
    }).then(function(response) {
      return response.data;
    }).catch(function(response){
      return response;
    });
  }
});
