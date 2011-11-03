$(function() {
	$('a[data-confirm]').click(function(e) {
		e.preventDefault();
		var link = $(this);
		if (confirm(link.data('confirm'))) {
			window.location = link.attr('href');
		}
	});
	
	$('ul.filters select').change(function() {
		$(this).closest('form').submit();
		
	});
});