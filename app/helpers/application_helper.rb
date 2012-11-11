module ApplicationHelper
	def materia_active(materia)
		unless params[:materia_id].blank?
			if materia == params[:materia_id].to_i
				'active'
			end
		end
	end

	def value_item(index)
		itens = ('A'..'Z').collect{|a| a}
		itens[index]
	end
end
