app.config(function($stateProvider, $urlRouterProvider) {

  $stateProvider
  .state('/', {
    url: '/home',
    templateUrl: '/views/site/home.html',
    controller: 'SiteController'
  })
  .state('menu',{
    abstract: true,
    url: '/dashboard',
    templateUrl: 'views/site/menu.html',
    controller: 'MenuController'
  })
  .state('menu.candidatoHome',{
    url: '/candidato/home',
    templateUrl: 'views/site/home-usuario.html',
    controller: 'HomeUsuarioController'
  })
  .state('menu.candidatoPerfil',{
    url: '/candidato/perfil',
    templateUrl: 'views/candidato/perfil.html',
    controller: 'PerfilCandidatoController'
  })
  .state('menu.candidatoCurriculo',{
    url: '/candidato/curriculo',
    templateUrl: 'views/candidato/curriculo.html',
    controller: 'CurriculoCandidatoController'
  })
  .state('menu.candidatoCombinacoes',{
    url: '/candidato/combinacoes',
    templateUrl: 'views/site/combinacoes.html',
    controller: 'CombinacoesController'
  })
  .state('menu.candidatoVagas',{
    url: '/candidato/vagas',
    templateUrl: 'views/candidato/vagas.html',
    controller: 'VagasController'
  })
  .state('menu.empresaHome',{
    url: '/empresa/home',
    templateUrl: 'views/site/home-usuario.html',
    controller: 'HomeUsuarioController'
  })
  .state('menu.empresaPerfil',{
    url: '/empresa/perfil',
    templateUrl: 'views/empresa/perfil.html',
    controller: 'PerfilEmpresaController'
  })
  .state('menu.empresaCombinacoes',{
    url: '/empresa/combinacoes',
    templateUrl: 'views/site/combinacoes.html'
  })
  .state('menu.empresaCurriculo',{
    url: '/empresa/curriculo',
    templateUrl: 'views/empresa/curriculo.html',
    controller: 'CurriculoEmpresaController'
  })
  .state('menu.empresaOferta',{
    url: '/empresa/ofertar-vagas',
    templateUrl: 'views/empresa/oferta.html',
    controller: 'OfertarVagaController'
  });

  $urlRouterProvider.otherwise('/home');

});
