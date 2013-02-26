(function($) {
	if( !$('#calendar-map').length ) {
		return;
	}
	var ll = $('#calendar-map').attr('data-coordinates').split(','),
		location = $('#calendar-map').attr('data-marker'),
		map,
		geocoder;

	google.maps.event.addDomListener(window, 'load', function() {
		geocoder = new google.maps.Geocoder;

		var mapOptions = {
			zoom: 14,
			center: new google.maps.LatLng(ll[0], ll[1]),
			mapTypeId: google.maps.MapTypeId.ROADMAP
		};

		map = new google.maps.Map($('#calendar-map').get(0), mapOptions);

		if( location && location.length > 0 ) {
			geocoder.geocode({'address': location}, function(res, status) {
				if( status == google.maps.GeocoderStatus.OK ) {
					new google.maps.Marker({
						position: res[0].geometry.location,
						map: map,
						title: 'Location'
					});
				} else {
					console.log('Could not geocode adres');
				}
			});

		}
	});
})(jQuery);