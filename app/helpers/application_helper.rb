module ApplicationHelper
	def materia_active(materia)
		unless params[:materia_id].blank?
			if materia == params[:materia_id].to_i
				'active'
			end
		end
	end
end
