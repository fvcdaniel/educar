require 'open-uri'
require 'json'

class FullfillBanca < ActiveRecord::Migration
  
#  result = [["ACAFE", 145], ["ACEP", 158], ["ADVISE", 9], ["AOCP", 16], ["CCV-UFC", 161], ["CECIERJ", 325], ["CEFET-BA", 163], ["CEPERJ", 200], ["CESGRANRIO", 5], ["CESPE", 2], ["CETAP", 31], ["CETRO", 32], ["CEV-URCA", 211], ["CFC", 259], ["COMPERVE", 34], ["CONESUL", 38], ["CONSULPLAN", 41], ["COPESE - UFT", 247], ["COPEVE-UFAL", 216], ["COPS-UEL", 43], ["COVEST-COPSET", 172], ["CRSP - PMRJ", 231], ["EJEF", 173], ["ESAF", 6], ["ESPP", 50], ["FADESP", 242], ["FAE", 176], ["FAPERP", 57], ["FAPEU", 55], ["FAURGS", 58], ["FCC", 1], ["FEC", 60], ["FEPESE", 61], ["FESMIP-BA", 275], ["FGV", 63], ["FIP", 175], ["FMP-RS", 190], ["FMZ - AP", 278], ["FUJB", 307], ["FUMARC", 68], ["FUNCAB", 195], ["FUNDATEC", 73], ["FUNDAÇÃO SOUSÂNDRADE", 72], ["FUNDEC", 222], ["FUNDEP", 74], ["FUNIVERSA", 174], ["FUNJAB-SC", 202], ["FUNRIO", 75], ["IADES", 276], ["IBFC", 189], ["IESES", 246], ["IF-SE", 224], ["INEP", 298], ["INSTITUTO CIDADES", 97], ["INTEGRI", 237], ["IPAD", 103], ["ISAE", 285], ["MB", 305], ["MOVENS", 114], ["MPDFT", 306], ["MPE-GO", 187], ["MPE-MG", 186], ["MPE-MS", 297], ["MPE-PB", 245], ["MPE-PR", 292], ["MPE-SC", 188], ["MPE-SP", 294], ["MPT", 289], ["MS CONCURSOS", 116], ["NCE-UFRJ", 3], ["ND", 178], ["NUCEPE", 258], ["OFFICIUM", 182], ["PC-MG", 309], ["PC-RJ", 315], ["PC-SP", 296], ["PGE-RO", 290], ["PGR", 291], ["PGT", 7], ["PONTUA", 308], ["PUC-PR", 128], ["PaqTcPB", 241], ["TJ-DFT", 283], ["TJ-PR", 287], ["TJ-RS", 233], ["TJ-SC ", 181], ["TRF - 4ª REGIÃO", 227], ["TRT - 6R (PE)", 277], ["TRT 14R", 249], ["TRT 15R", 263], ["TRT 21R (RN)", 201], ["TRT 23R (MT)", 244], ["TRT 24R (MS)", 314], ["TRT 2R (SP)", 220], ["TRT 3R", 270], ["TRT 8R", 185], ["UEG", 316], ["UESPI", 191], ["UFBA", 253], ["UFF", 229], ["UFG", 196], ["UFMT", 250], ["UFPA", 260], ["UFPR", 119], ["UNICENTRO", 333], ["UNIRIO", 228], ["UPENET", 149], ["VUNESP", 152]] 
  def up

  	result = JSON.parse(open("http://www.questoesdeconcursos.com.br/ajaxcombo/organizadoras/q/").read)
  	result.each do |r|
  		banca = Banca.new(:nome => r[0])
  		banca.save if banca.valid?
  	end

  end

  def down
  	result = JSON.parse(open("http://www.questoesdeconcursos.com.br/ajaxcombo/organizadoras/q/").read)
  	result.each do |r|
  		banca = Banca.find_by_nome(:nome => r[0])
  		banca.destroy if banca
  	end
  end
end
