$(document).on('turbolinks:load', function(){

  var search_list = $('#user-search-result');
  var user_list = $('#group-users');

  function appendUser(user){
    var html = `<div class="group-user clearfix">
                  <p class="group-user__name">${ user.name }</p>
                  <a class="user-search-add group-user__btn group-user__btn--add" data-user-id="${ user.id }" data-user-name="${ user.name }">追加</a>
                </div>`
    search_list.append(html);
  }

  function appendNoUser(text){
    var html = `<div class="group-user clearfix">
                  <p class="group-user__name">${ text }</p>
                </div>`
    search_list.append(html);
  }

  function appendUserToGroup(id, name){
    var html = `<div class='group-user clearfix js-chat-member' id="group-user-${ id }">
                  <input name='group[user_ids][]' type='hidden' value="${ id }">
                  <p class='group-user__name'>${ name }</p>
                  <a class='user-search-remove group-user__btn group-user__btn--remove js-remove-btn' data-user-id="${ id }" data-user-name="${ name }" >削除</a>
                </div>`
    user_list.append(html);
  }

  $('#user-search-field').on('keyup', function(){
    var input = $('#user-search-field').val();
    console.log(input);

    $.ajax({
      type: 'GET',
      url: '/users',
      data: { keyword: input },
      dataType: 'json'
    }).done(function(users){
      $('#user-search-result').empty();
      if(users.length !== 0){
        users.forEach(function(user){
          appendUser(user);
        });
      }
      else{
        appendNoUser("一致するユーザーはいません");
      }
    }).fail(function(){
      alert('ユーザーの取得に失敗しました');
    });
  });

  $('#user-search-result').on('click', '.group-user__btn--add', function(){
    var id = $(this).data('user-id');
    var name = $(this).data('user-name');
    appendUserToGroup(id, name);
    $(this).parent().remove();
  });

  $('#group-users').on('click', '.js-remove-btn', function(){
    $(this).parent('.js-chat-member').remove();
  });
});
