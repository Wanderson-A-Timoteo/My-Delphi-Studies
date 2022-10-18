function rc_scrollSmoothToBottom (id,offset) {
   var div = document.getElementById(id);
   $('#' + id).animate({
      scrollTop: ( div.scrollHeight - div.clientHeight ) + offset
  }, 350);
};
function rc_scrollSmoothToTop (id) {
   var div = document.getElementById(id);
   $('#' + id).animate({
      scrollTop: div.scrollHeight //0
  }, 350);
};