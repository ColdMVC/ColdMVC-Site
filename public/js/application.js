(function($) { 
	
	$(document).ready(function() {
		
		var parameters = $('div.parameters');		
		parameters.find('td:empty').addClass('empty').html('[empty string]');		
		parameters.find('td:nth-child(4)').css('white-space', 'nowrap');		
		
		var sidebar = $('#sidebar_container');		
		if (sidebar.length) {			
			var content = $('#content');			
			var contentHeight = content.height();
			var sidebarHeight = sidebar.height();			
			var height = (contentHeight > sidebarHeight) ? contentHeight : sidebarHeight;
			content.height(height);
			sidebar.height(height);					
		}
		
	});
	
})(jQuery);