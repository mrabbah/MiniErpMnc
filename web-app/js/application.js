if (typeof jQuery !== 'undefined') {
    (function($) {
        setInterval(function() {            
            //call $.ajax here
        }, 5000); //5 seconds
//		$('#spinner').ajaxStart(function() {
//			$(this).fadeIn();
//		}).ajaxStop(function() {
//			$(this).fadeOut();
//		});
    })(jQuery);
}
