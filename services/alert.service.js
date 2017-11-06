app.service('AlertService', function(){
  /*
    Docs:
    https://github.com/limonte/sweetalert2
    https://limonte.github.io/sweetalert2/
  */
  this.errorModal = function(message){
    message = message || 'Nenhuma mensagem de erro cadastrada';
    swal ({
      title: "Ops! Algo deu errado...",
      html: message,
      type: "error"
    }).catch(swal.noop);
  };

  this.successModal = function(message){
    message = message || 'Nenhuma mensagem de sucesso cadastrada';
    swal ( "Tudo certo! :)" , message,  "success" );
    swal ({
      title: "Tudo certo! :)",
      html: message,
      type: "success"
    }).catch(swal.noop);
  };

  /*
    Caso não consiga obter o resultado com as outras modals, utilize esta função...
    Tipos de modals:
      - warning
      - error
      - success
      - info
      - question
    Parametros:
      - type: Recebe o tipo da modals
      - title: titulo da modal
      - html: Recebe a descricao da modal, pode ser passado um html
  */
  this.showModal = function(type, title, html){
    type = type || 'error';
    title = title || 'Ops! Algo deu errado...';
    html = html || '<u>Nenhuma descricao cadastrada</u>';
    swal({
      title: title,
      type: type,
      html: html
    }).catch(swal.noop); //swal.noop retira erro de promise do log do navegador
  };

  this.loadingModal = function(){
    swal({title: 'Aguarde...'});
    swal.showLoading();
  };
});
