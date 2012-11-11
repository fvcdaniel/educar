// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .

jQuery(document).ready(function() {

	$("input[name='item_questao']").change(function(){
		
		var data1 = $('#questao_id').val();
		var data2 = $("input[name='item_questao']:checked").val();
		$.ajax({
			type: "GET",
			 url: "http://"+location.host+"/home/dynamic_select_item/"+data1+"?resp="+data2,
			data: data1,
			dataType: "script"
		});

	});

});

function ajaxResp(questao){

	var str_data = "input[name='"+questao+"_item_questao']:checked"
	var data = $(str_data).val();
	$.ajax({
		type: "GET",
		 url: "http://"+location.host+"/home/dynamic_select_item/"+questao+"?resp="+data,
		data: questao,
		dataType: "script"
	});

}

