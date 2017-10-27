app.service('AlertService', function(){
  this.errorModal = function(message){
    message = message || 'Nenhuma mensagem de erro cadastrada';
    swal ( "Ops! Algo deu errado...", message, "error" );
  };

  this.successModal = function(message){
    message = message || 'Nenhuma mensagem de sucesso cadastrada';
    swal ( "Tudo certo! :)" ,  message ,  "success" );
  };

  this.warningModal = function(message){
    message = message || 'Nenhuma mensagem de aviso cadastrado...';
    swal ( "Cuidado! o.O", message,  "warning" );
  };

});
