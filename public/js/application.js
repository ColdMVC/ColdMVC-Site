(function($) { 
	
	$(document).ready(function() {
	
		$('div.parameters td:empty').addClass('empty').html('[empty string]');			
		
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