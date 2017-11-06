app.config(function($routeProvider) {
  $routeProvider
  .when("/", {
    templateUrl: "views/site/home.html",
    controller: "HomeController"
  })
  .when("/contato", {
    templateUrl: "views/site/pg2.html"
  })
  .when("/candidato/perfil",{
    templateUrl: "views/candidato/perfil.html",
    controller: 'PerfilController'
  })
  .when("/cadastro", {
    templateUrl: 'views/site/cadastro.html'
  })
  .otherwise({ redirectTo: '/'});

});
