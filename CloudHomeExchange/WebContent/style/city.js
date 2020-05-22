$(function() {
    $("#cityjson1").autocomplete({
    	source: function (request, response) {
    		jQuery.getJSON(
    			"https://secure.geobytes.com/AutoCompleteCity?key=7c756203dbb38590a66e01a5a3e1ad96&callback=?&q="+request.term,
    			function (data) {
    			 response(data);
    			}
    		 );
    		},
    	});
    		$("#cityjson1").autocomplete({	
    			minChars: 0,
    		    messages: "",
    		    minLength: 3
    		});
    		
    
    		
    		$("#cityjson2").autocomplete({
    	    	source: function (request, response) {
    	    		jQuery.getJSON(
    	    			"https://secure.geobytes.com/AutoCompleteCity?key=7c756203dbb38590a66e01a5a3e1ad96&callback=?&q="+request.term,
    	    			function (data) {
    	    			 response(data);
    	    			}
    	    		 );
    	    		},
    	    	});
    	    		$("#cityjson2").autocomplete({	
    	    			minChars: 0,
    	    		    messages: "",
    	    		    minLength: 3
    	    		});		
});