// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require jquery
//= require jquery-ui/widgets/slider




function myFunction() {
  var x = document.getElementById("myTopnav");
  if (x.className === "topnav") {
    x.className += " responsive";
  } else {
    x.className = "topnav";
  }
}


/* unused form submission prevent default fetch and display results 
<script>	

$(":submit").on("click", function (event){

	event.preventDefault();

  var url=$(this).closest('form').attr('action'),	data=$(this).closest('form').serialize(), button=$(this);

	$.ajax({
	type: 'post',
	url: url,
	data: data,
		success: function(results) {
			var votes = $(".votes")
			var buttons = $(":submit")
			$.get(location.href).then(function(page) {
				$.each(votes, function(i, value) {
					votes.eq(i).html($(page).find(".votes").eq(i).html())
				});
				$.each(buttons, function(i, value) {
					var color = $(page).find(":submit").eq(i).css("color")
					buttons.eq(i).css("color", color)
				});
			});
		}
	});
});

</script>
*/
