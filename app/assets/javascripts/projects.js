$(document).on('ready page:load', function(){
	
	 $(".pledge_button").click(function(e){
		var pledgeUrl = $(e.currentTarget).data('pledge-url');

		var amount = $('.pledge_button span').html();

	    $.ajax({
	    type: "POST",
	    url: pledgeUrl,

	    data: 'amount=' + amount,
	    dataType: 'html',
	    success: function(data){
	    	$('#amount').html(data)
	    }
	  })
    });


//Updating page every 2 secs:
// function updatePage(){
	// 	$.get(location.pathname, function(data){
	// 		$("#project_info").html(data)
	// 	});
	// }

	// setInterval(updatePage, 2000);
	//or
		// start_timer = function() { 
	// 	updatePage()
	// 	setTimeout(start_timer, 2000)
	// }

	// start_timer()
///////////////////////////////////////////



	//var amount = 0;

	// $(".pledge_button").click(function(e){
	// 	var pledgeUrl = $(e.currentTarget).data('pledge-url');
	// 	//amount = $('.pledge_button span').html();
	// 	//console.log('amount: ' + amount);

	//     $.ajax({
	//     type: "POST",
	//     // url: pledge_create,
	//     url: pledgeUrl,
	//     success: function(data){
	//     	$('body').prepend(data)
	//     }
	//     // url: location.pathname + '?amount=' + amount,
	//     // data: { parameters: amount }
	//     // data: 'amount=' + amount
	//   })

	// 	// $.post( pledge_create, function( data ) {
	// 	// 	$( ".result" ).html( data );
	// 	// });
 //    });
});
