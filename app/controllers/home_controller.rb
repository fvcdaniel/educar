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
  def resolvendo
  	unless(params[:materia_id].blank?)
    	@materia = params[:materia_id]
    end
    unless(params[:assunto_id].blank?)
    	@assunto = params[:assunto_id]
    end
    unless(params[:concurso_id].blank?)
    	@concurso = params[:concurso_id]
    end
    if (@materia and @assunto and @concurso)
    	@questoes = Questao.where("materia_id = ? and assunto_id = ? and concurso_id = ? ", @materia, @assunto, @concurso).order(:id)
    elsif (@materia and @assunto)
    	@questoes = Questao.where("materia_id = ? and assunto_id = ? ", @materia, @assunto).order(:id)
    elsif (@materia and @concurso)
    	@questoes = Questao.where("materia_id = ? and concurso_id = ? ", @materia, @concurso).order(:id)
    elsif (@assunto and @concurso)
    	@questoes = Questao.where("assunto_id = ? and concurso_id = ? ", @assunto, @concurso).order(:id)
    elsif (@materia)
    	@questoes = Questao.where("materia_id = ? ", @materia).order(:id)
    elsif (@assunto)
    	@questoes = Questao.where("assunto_id = ? ", @assunto).order(:id)
    elsif (@concurso)
    	@questoes = Questao.where("concurso_id = ? ", @concurso).order(:id)
    else
    	@questoes = Questao.first(100)
    end
  end
end
