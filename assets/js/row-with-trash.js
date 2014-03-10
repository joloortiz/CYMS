$('.row-with-trash').hover(function() {
	$(this).find('.row-trash-icon').removeClass('absolute-hide');
}, function() {
	$(this).find('.row-trash-icon').addClass('absolute-hide');
});