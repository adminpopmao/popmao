REGEX_BLANK = /^\s*$/;
REGEX_EMAIL = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-]{2,})+\.)+([a-zA-Z0-9]{2,})+$/;

HAVE_ERROR = '';
$$('input.have_tooltip').each(function(node){
  node.observe("blur",function(){
    node.up('div').removeClassName('hs_28px_on').addClassName('hs_28px');
    checkInput(node)});
  node.observe("focus",function(){
    node.up('div').removeClassName('hs_28px').addClassName('hs_28px_on')});
});

function checkSubmit(){
  HAVE_ERROR = '';
  checkInput($('user_login'));
  checkInput($('user_password'));
  checkInput($('user_password_confirmation'));
  checkInput($('user_email'));
  if (HAVE_ERROR==''){
    new Ajax.Request('/users/check_user_name', {
        asynchronous: false,
        parameters: "login="+ $F('user_login')
    });
    new Ajax.Request('/users/check_user_email', {
        asynchronous: false,
        parameters: "email="+ $F('user_email')
    });
  }
  if (HAVE_ERROR=='')
    $('signupform').submit();
  else
    alert('请将信息填写完整！');
}

function checkInput(el){
  var value = $F(el);
  switch (el.id){
  case 'user_login':
    if (value.match(REGEX_BLANK))
      set_error_info(el,'用户名不能为空');
    else if (value.length<6) 
      set_error_info(el,'用户名长度不能小于6');
    else
      new Ajax.Request('/users/check_user_name', {
          parameters: "login="+ value
      });
    break;
  case 'user_password':
    if (value.match(REGEX_BLANK))
      set_error_info(el,'密码不能为空');
    else if (value.length<6)
      set_error_info(el,'密码长度不能小于6');
    else
      set_pass_info(el);
    break;
  case 'user_password_confirmation':
    if (value.match(REGEX_BLANK))
      set_error_info(el,'密码确认不能为空');
    else if (value != $F('user_password'))
      set_error_info(el,'二个密码前后不一致！');
    else
      set_pass_info(el);
    break;
  case 'user_email':
    if (value.match(REGEX_BLANK))
      set_error_info(el, '邮件必须输入！');
    else if (!value.match(REGEX_EMAIL))
      set_error_info(el, '邮件格式不正确!');
    else
      new Ajax.Request('/users/check_user_email', {
          parameters: "email="+ value
      });
    break;
  }
}
function set_pass_info(el){
  if ($(el.id+'_error')) $(el.id+'_error').remove();
  if ($(el.id+'_pass')) $(el.id+'_pass').remove();
  el.insert({after:'<label id="' + el.id + '_pass" class="error checked"> </label>'});
}
function set_error_info(el,err_info){
  if ($(el.id+'_error')) $(el.id+'_error').remove();
  if ($(el.id+'_pass')) $(el.id+'_pass').remove();
  el.insert({after:'<label id="'+ el.id +'_error" class="error">' + err_info + '</label>'});
  HAVE_ERROR = err_info;
}
