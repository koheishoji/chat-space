$(function() {

  function messageBody(message) {
    var messageBody = ""
    if(message.image_url == null) {
      messageBody = `${ message.body }`
    }else if(message.body == null) {
      messageBody = `<img src="${ message.image_url }">`
    }else{
      messageBody = `${ message.body }
                     <img src="${ message.image_url }">`
    }
    return messageBody
  }

  function buildHTML(message) {
    var html = `<div class="right__log__message" message_id="${ message.id }">
                  <div class="right__log__message__name">
                    ${ message.user_name }
                  </div>
                  <div class="right__log__message__date">
                    ${ message.date }
                  </div>
                  <div class="right__log__message__body">
                    ` + messageBody(message) + `
                  </div>
                </div>`
    return html;
  }

  $('#new_message').on('submit', function(e) {
    e.preventDefault();
    var formData = new FormData(this);
    var href = window.location.href;

    $.ajax({
      url: href,
      type: 'POST',
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    }).done(function(data){
      var html = buildHTML(data);
      $('.right__log').append(html);
      $('.right__log').animate({scrollTop: $('.right__log')[0].scrollHeight});
      $('#new_message').trigger('reset');
    }).fail(function() {
      alert('error')
    })
    return false;
  });

  // automatic update
  setInterval(function(){
    var href = window.location.href;

    if(href.match(/messages/)){
      var last_message_id = $('.right__log__message').last().attr("message_id");

      $.ajax({
        url: href + '/auto',
        type: 'POST',
        data: { last_id: last_message_id },
        dataType: 'json'
      }).done(function(messages){
        messages.forEach(function(message){
          if(message.id > last_message_id){
            var html = buildHTML(message);
            $('.right__log').append(html);
          }
        });
      }).fail(function(){
        alert('更新してください');
      });
    }

  }, 5000);

});
