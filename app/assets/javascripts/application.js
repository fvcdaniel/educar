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

	jQuery('#questao_materia_id').change(function() {
		var data = $('#questao_materia_id').val();
		$.ajax({
			type: "GET",
			 url: "http://"+location.host+"/questoes/dynamic_select_assuntos/"+data,
			data: data,
			dataType: "script"
		});
	});

	jQuery('#add_item').click(function() {
		var data = tinyMCE.get('questao_item').getContent();
		var questao_id = $('#questao_id').val();
		if(data == ''){
			alert('não pode ficar em branco')
		}else{
			$.ajax({
				type: "GET",
				url: "http://"+location.host+"/questoes/dynamic_add_item?item_desc="+data+"&questao_id="+questao_id,
				data: data,
				dataType: "script"
			});
			$('#questao_item').val('');
		}
		tinyMCE.get('questao_item').setContent('');
		return false;
	}); 

});

function ajaxResp(questao){

	var start_time = $('#start_time').val();
	var str_data = "input[name='"+questao+"_item_questao']:checked"
	var data = $(str_data).val();

	$.ajax({
		type: "GET",
		 url: "http://"+location.host+"/home/dynamic_select_item/"+questao+"?resp="+data+"&start_time="+start_time,
		data: questao,
		dataType: "script"
	});

}

function ajaxResp2(questao){

	var start_time = $('#start_time').val();
	var checked = []
	$("input[name='"+questao+"_item_questao']:checked").each(function () {
    	checked.push($(this).val());
	});
	$.ajax({
		type: "GET",
		 url: "http://"+location.host+"/home/dynamic_select_item/"+questao+"?resp="+checked+"&start_time="+start_time,
		data: questao,
		dataType: "script"
	});

}

function delete_item_temp(index){
	if (confirm("Você tem certeza?")){
		var questao_id = $('#questao_id').val();
		$.ajax({
			type: "GET",
			url: "http://"+location.host+"/questoes/dynamic_add_item?op=D&item_index="+index+"&questao_id="+questao_id,
			data: '',
			dataType: "script"
		});
	}
	return false;
}

