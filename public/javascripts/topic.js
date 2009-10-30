$('smallfont').observe('click', function(){
    $$('.postcontent').invoke('setStyle', 'font-size:12px;');
    this.addClassName('u_fsize');
    $('bigfont').removeClassName('u_fsize');
});

$('bigfont').observe('click', function(){
    $$('.postcontent').invoke('setStyle', 'font-size:14px;');
    this.addClassName('u_fsize');
    $('smallfont').removeClassName('u_fsize');
});

