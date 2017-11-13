app.config(function($stateProvider, $urlRouterProvider) {

  $stateProvider
  .state('/', {
    url: '/home',
    templateUrl: '/views/site/home.html'
  })
  .state('menu',{
    abstract: true,
    url: '/dashboard',
    templateUrl: 'views/site/menu.html'
  })
  .state('menu.candidatoHome',{
    url: '/candidato/home',
    templateUrl: 'views/candidato/home.html'
  })
  .state('menu.candidatoPerfil',{
    url: '/candidato/perfil',
    templateUrl: 'views/candidato/perfil.html'
  })
  .state('menu.candidatoCurriculo',{
    url: '/candidato/curriculo',
    templateUrl: 'views/candidato/curriculo.html'
  })
  .state('menu.empresaHome',{
    url: '/empresa/home',
    templateUrl: 'views/empresa/home.html'
  })
  .state('menu.empresaCombinacoes',{
    url: '/empresa/combinacoes',
    templateUrl: 'views/empresa/combinacoes.html'
  })
  .state('menu.empresaCurriculo',{
    url: '/empresa/curriculo',
    templateUrl: 'views/empresa/curriculo.html'
  })
  .state('menu.empresaOferta',{
    url: '/empresa/ofertar-vagas',
    templateUrl: 'views/empresa/oferta.html'
  });
  $urlRouterProvider.otherwise('/home');
  //
  // $routeProvider
  // .when("/contato", {
  //   templateUrl: "views/site/pg2.html"
  // })
  // .when("/candidato/perfil",{
  //   templateUrl: "views/candidato/perfil.html",
  //   controller: 'PerfilController'
  // })
  // .when("/cadastro", {
  //   templateUrl: 'views/site/cadastro.html'
  // })
  // .when("/candidato/home", {
  //   templateUrl: "views/candidato/home.html"
  // })
  // .otherwise({ redirectTo: '/'});

});
