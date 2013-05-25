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

	def default_class(page_class)
		if page_class.empty?
			'yeld-unit'
		else
			page_class
		end
	end

	def sortable(column, title = nil)
  		title ||= column.titleize
		css_class = column == sort_column ? "current #{sort_direction}" : nil
		direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
		link_to title, {:sort => column, :direction => direction}, {:class => css_class}
	end

end
