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
//= require jquery-ui
//= require autocomplete-rails

//= require jquery.modal


//require jquery.ui.all

jQuery(document).ready(function() {

	$("input[name='item_questao']").change(function(){
		
		var data1 = $('#questao_id').val();
		var data2 = $("input[name='item_questao']:checked").val();
		$.ajax({
			type: "GET",
			 url: window.location.protocol+"//"+location.host+"/home/dynamic_select_item/"+data1+"?resp="+data2,
			data: data1,
			dataType: "script"
		});

	});

	jQuery('#questao_materia_id').change(function() {
		var data = $('#questao_materia_id').val();
		$.ajax({
			type: "GET",
			 url: window.location.protocol+"//"+location.host+"/questoes/dynamic_select_assuntos/"+data,
			data: data,
			dataType: "script"
		});
	});

	jQuery('#add_item').click(function() {
		var questao_id = $('#questao_id').val();
		vars = new Object();
		vars.item_desc = tinyMCE.get('questao_item').getContent();
		vars.questao_id = $('#questao_id').val();;
		if(vars.item_desc == ''){
			alert('não pode ficar em branco')
		}else{
			$.ajax({
				type: "GET",
				url: window.location.protocol+"//"+location.host+"/questoes/dynamic_add_item?questao_id="+questao_id,
				data: vars,
				dataType: "script"
			});
			$('#questao_item').val('');
		}
		tinyMCE.get('questao_item').setContent('');
		return false;
	}); 

	jQuery('.ajax_comment').submit(function() {
		
		var id_texto = $(this).attr('id') + '_texto';
		var questao_id = $('#' + $(this).attr('id') + '_questao_id').val();

		var content = tinyMCE.get(id_texto).getContent();
		vars = new Object();
		vars.comment = content;

		vars.questao_id = questao_id;

		if(vars.comment == ''){
			alert('não pode ficar em branco');
		}else{
			$.ajax({
				type: "POST",
				url: window.location.protocol+"//"+location.host+"/home/dynamic_add_comment?questao_id="+questao_id,
				data: vars,
				dataType: "script"
			});
			tinyMCE.get(id_texto).setContent('');
		}
		return false;
	}); 

});

function buttonComments(questao_id){
	var display = $("#hider"+questao_id).css('display');
	if(display == 'none'){
		$('#button_hide'+questao_id).children('i').attr('class', ' icon-chevron-up');
		$("#hider"+questao_id).show("slow");
	}else{
		$('#button_hide'+questao_id).children('i').attr('class', ' icon-chevron-down');
		$("#hider"+questao_id).hide("slow");	
	}
}

function ajaxRespM(questao){

	var start_time = $('#start_time').val();
	var str_data = "input[name='"+questao+"_item_questao']:checked"
	var data = $(str_data).val();

	$.ajax({
		type: "GET",
		 url: window.location.protocol+"//"+location.host+"/home/dynamic_select_item/"+questao+"?resp="+data+"&start_time="+start_time,
		data: questao,
		dataType: "script"
	});

}

function ajaxRespA(questao){

	var start_time = $('#start_time').val();
	var checked = []
	$("select[name='"+questao+"_item_questao']").each(function () {
    	checked.push($(this).val());
	});
	$.blockUI({ message: '<h1><img src="/assets/busy.gif" /> Só um momento...</h1>' });
	$.ajax({
		type: "GET",
		 url: window.location.protocol+"//"+location.host+"/home/dynamic_select_item/"+questao+"?resp="+checked+"&start_time="+start_time,
		data: questao,
		dataType: "script"
	});
	$.unblockUI();
}

function delete_item_temp(index){
	if (confirm("Você tem certeza?")){
		var questao_id = $('#questao_id').val();
		$.ajax({
			type: "GET",
			url: window.location.protocol+"//"+location.host+"/questoes/dynamic_add_item?op=D&item_index="+index+"&questao_id="+questao_id,
			data: '',
			dataType: "script"
		});
	}
	return false;
}

/* $('#new_comment').live("ajax:complete", function(event,xhr,status){
	alert('caution');
	$(this).children('.text').children('.controls').children('textarea').val('');
    var questao_id = $(this).children('.hidden').children('.controls').children('input').val();
    $.ajax({
			type: "POST",
			url: window.location.protocol+"//"+location.host+"/home/dynamic_get_comment?op=R&questao_id="+questao_id,
			data: '',
			dataType: "script"
		});
});
*/

function get_comments(elem){
	vars = new Object();
    vars.questao_id = $(elem).attr('questao_id');
    vars.comment_id = $(elem).attr('comment_id');
    vars.op = "D";
    if(confirm("Você tem certeza?")){
    	$.ajax({
			type: "POST",
			url: window.location.protocol+"//"+location.host+"/home/dynamic_get_comment",
			data: vars,
			dataType: "script"
		});
    }
    return false;
}

