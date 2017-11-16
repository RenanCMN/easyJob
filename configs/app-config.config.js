var app = angular.module('easyjobWeb', ['ngAnimate', 'ui.router'])
.constant('CONFIG',{
  AppName: "EasyJob",
  headers: {'Content-Type' : 'application/x-www-form-urlencoded; charset=UTF-8'},
  urlWebService: 'http://easyjob.luingry.com.br/api/',
  urlLocalHost: 'http://localhost/easyjob/api/',
});
