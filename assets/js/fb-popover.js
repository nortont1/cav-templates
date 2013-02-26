$(document).ready(function() {
  $('.fb-popover').popover(
    {
      placement: 'top',
      offset: 15,
      trigger: 'manual',
      delay: { show: 350, hide: 100 },
      html: true,
      content: function() {return $('.fbbox').html();}
    }
  );
    var timer,
        popover_parent;
    function hidePopover(elem) {
        $(elem).popover('hide');
    }
    $('.fb-popover').hover(
        function() {
          var self = this;
          clearTimeout(timer);
          $('.popover').hide(); //Hide any open popovers on other elements.
          popover_parent = self
          $(self).popover('show');            
        }, 
        function() {
          var self = this;
          timer = setTimeout(function(){hidePopover(self)},300);                 
    });
    $('.popover').live({
      mouseover: function() {
        clearTimeout(timer);
      },
      mouseleave: function() {
        var self = this;
        timer = setTimeout(function(){hidePopover(popover_parent)},300); 
      }
    });
});
