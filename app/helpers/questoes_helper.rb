module QuestoesHelper
	
	def get_tipo(tipo)
		if tipo == "M"
			"Multipla Escolha"
		elsif tipo == "C"
			"Certa / Errada"
		else
			"Outro"
		end
	end

end
