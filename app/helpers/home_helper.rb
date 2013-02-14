#encoding=utf-8
module HomeHelper

	def questao_texto (questao, index)
		"<div style=\"background-color:#F9F9F9; padding-left:10px; margin-right:-60px; padding-right:30px;\"> #{index+1} <div style=\"padding-left:35px; padding-bottom:10px; \"> #{questao.texto} </div> </div>"
	end

	def item_desc(item, index)
		unless item.blank? and index.blank?
			itens = ('A'..'Z').collect{|a| a}
			"#{itens[index]} <div style=\"padding-left:45px;\"> #{item.desc} </div>"
		else
			"não foi possível identificar a descrição do item"
		end
	end

	def ajaxResp(questao)
		if questao.tipo == 'M'
			'javascript:ajaxRespM('+questao.id.to_s+');'
		else
			'javascript:ajaxRespA('+questao.id.to_s+');'
		end
	end

end
