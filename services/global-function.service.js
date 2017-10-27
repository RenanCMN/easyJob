app.service('GlobalFunctionService', function(){
  //15 effects
  var animations = [ "toggle", "spin-toggle", "scale-fade", "scale-fade-in",
        						"bouncy-scale-in", "flip-in", "slide-left", "slide-right",
        						"slide-top", "slide-down", "bouncy-slide-left", "bouncy-slide-right",
        						"bouncy-slide-top", "bouncy-slide-down", "rotate-in"];

  //retorna um item randomico do array animations
  this.getRandomEffect = function(){
    var randomNumber = Math.floor((Math.random() * 14) + 1);
    return animations[randomNumber];
  };

  //criar busca de CEP e retornar endereço como JSON

});
