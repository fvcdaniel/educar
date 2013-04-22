#encoding=utf-8
module HomeHelper

	def questao_texto (questao, index)
		"<div class=\"span12\" style=\"background-color:#F9F9F9; padding-left:10px;\"> <a href=\"/home/resolvendo/?questao_id=#{questao.id}\" > #{index+1} </a> <div style=\"padding-left:25px; padding-right:20px; padding-bottom:10px; \"> #{questao.texto} </div> </div>"
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

	def write_burndown(burndown, flag)
		str = 'http://apps.vanpuffelen.net/charts/burndown.jsp?'
		if burndown.dias.blank?
			return ""
		end
		numbers = []
		burndown.dias.times {|i| numbers << i+1 }
		days = numbers.join(",")
		str += 'days='+days

		computacao = (burndown.computacao.split(",").map { |s| s.to_i })
		portugues = (burndown.portugues.split(",").map { |s| s.to_i })
		rlogico = (burndown.rlogico.split(",").map { |s| s.to_i })
		dadmin = (burndown.dadmin.split(",").map { |s| s.to_i })
		dconst = (burndown.dconst.split(",").map { |s| s.to_i })

		result = computacao.zip(portugues).map {|a| a.inject(:+)}
		result = result.zip(portugues).map {|a| a.inject(:+)}
		result = result.zip(portugues).map {|a| a.inject(:+)}
		result = result.zip(portugues).map {|a| a.inject(:+)}

		result = result.join(",")

		str += '&work='+result
		
		str += '&colors='+burndown.colors		
	end

end

