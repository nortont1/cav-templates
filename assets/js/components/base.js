$(document).ready(function() {
	$('.carousel').carousel({
		interval: 5000
	});

	if( $('.fancybox').length ) {
		$('.fancybox').fancybox();
	}

	$('.comment-ticker').each(function() {
		$(this).prepend($('<i class="icon-comment"></i>'));
	});

	var _nav_current = $('.subnav .selected');
	var _nav_timer = false;
	$('.nav a').mouseenter(function() {
		if( _nav_timer ) {
			clearTimeout(_nav_timer);
		}
		var sub = $(this).attr('rel');
		if( $('#sub-'+sub).length ) {
			$('.subnav ul').removeClass('selected');
			$('#sub-'+sub).addClass('selected');
		}
	}).mouseleave(function() {
		var $this = $(this);
		_nav_timer = setTimeout(function() {
			var sub = $this.attr('rel');
			if( $('#sub-'+sub).length ) {
				_nav_current.addClass('selected');
				$('#sub-'+sub).removeClass('selected');
			}
		}, 500);
	});
	$('.subnav ul').mouseenter(function() {
		if( _nav_timer ) {
			clearTimeout(_nav_timer);
		}
	}).mouseleave(function() {
		_nav_timer = setTimeout(function() {
			$('.subnav ul').removeClass('selected');
			_nav_current.addClass('selected');
		}, 500);
	});

	if( $(window).width() <= 700 ) {
		$('.mobile-push-top').each(function() {
			$(this).parents('.row').prepend($(this));
		});
	}
	$(window).resize(function() {
		if( $(window).width() <= 700 ) {
			$('.mobile-push-top').each(function() {
				$(this).parents('.row').prepend($(this));
			});
		}
	});
});