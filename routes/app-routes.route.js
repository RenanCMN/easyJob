app.config(function($routeProvider) {
  $routeProvider
  .when("/", {
    templateUrl : "views/home.html"
  })
  .when("/contato", {
    templateUrl : "views/contato.html"
  })
  .otherwise('/');

});
