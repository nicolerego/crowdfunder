$(document).on('ready page:load', function(){
	function updatePage(){
		$.get(location.pathname, function(data){
			$("#project_info").html(data)
		});
	}

	start_timer = function() { 
		updatePage()
		setTimeout(start_timer, 2000)
	}

	start_timer()
});
