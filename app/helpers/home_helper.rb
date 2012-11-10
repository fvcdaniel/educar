#encoding=utf-8
module HomeHelper

	def questao_texto (questao)
		"#{questao.id} - #{questao.texto}"
	end

	def item_desc(item, index)
		unless item.blank? and index.blank?
			itens = ('a'..'z').collect{|a| a}
			"#{itens[index]} - #{item.desc}"
		else
			"não foi possível identificar a descrição do item"
		end
	end

end
