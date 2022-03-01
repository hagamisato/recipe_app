window.onload = function(){
  console.log('javascript動いている')
  // バリデーションエラーの場合にテキストボックスを赤くする
  // タイトル
  if ($('.error_title').data('error_title') == 1) {
    $('.title').addClass('error_textbox')
  };
  // 材料
  if ($('.error_nm_material').data('error_nm_material') == 1) {
    $('.nm_material').addClass('error_textbox')
  };
  // 分量
  if ($('.error_amnt_material').data('error_amnt_material') == 1) {
    $('.amnt_material').addClass('error_textbox')
  };
  // 手順の説明
  if ($('.error_explain').data('error_explain') == 1) {
    $('.explain').addClass('error_textbox')
  };  
};

$(function(){
  console.log('バリデーション')
  $('#form').validate({
    rules: {
      name: {
        required: true,
      },
      email: {
        required: true,
      },
      tel: {
        required: true,
        number : true,
        maxlength: 20,
      },
    },
  })
})
