class HomeController < ApplicationController
  def index
    unless(params[:materia_id].blank?)
    	@concursos = Concurso.includes(:questoes).where("questoes.materia_id = ?",params[:materia_id]).order(:nome)
    	@assuntos = Assunto.where("materia_id = ? and assunto_id is null",params[:materia_id]).order(:nome)
    else
    	@concursos = Concurso.all(:order => :nome)
    	@assuntos = Assunto.where(:assunto_id => nil).order(:nome).limit(100)
    end
  end
end
