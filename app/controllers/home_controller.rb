class HomeController < ApplicationController
  
  def index
    
    unless(params[:materia_id].blank?)
      @materia = Materia.find(params[:materia_id])
    end
    
    if %w[ass con].include?(params[:por])
    	
      unless(params[:materia_id].blank?)
      	@concursos = Concurso.includes(:questoes).where("questoes.materia_id = ?",params[:materia_id]).order("ano desc").paginate(:page => params[:page], :per_page => 30)
      	@assuntos = Assunto.where("materia_id = ? and assunto_id is null",params[:materia_id]).order(:nome)
      else
      	@concursos = Concurso.all(:order => :nome)
      	@assuntos = Assunto.where(:assunto_id => nil).order(:nome).limit(100)
      end

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
    unless(params[:questao_id].blank?)
      @questao = params[:questao_id]
    end
    if (@questao)
      @questoes = Questao.where("id = ? ", @questao).paginate(:page => params[:page], :per_page => 10)
    elsif (@materia and @assunto and @concurso)
    	@questoes = Questao.where("materia_id = ? and assunto_id = ? and concurso_id = ? ", @materia, @assunto, @concurso).order(:id).paginate(:page => params[:page], :per_page => 10)
    elsif (@materia and @assunto)
    	@questoes = Questao.where("materia_id = ? and assunto_id = ? ", @materia, @assunto).order(:id).paginate(:page => params[:page], :per_page => 10)
    elsif (@materia and @concurso)
    	@questoes = Questao.where("materia_id = ? and concurso_id = ? ", @materia, @concurso).order(:id).paginate(:page => params[:page], :per_page => 10)
    elsif (@assunto and @concurso)
    	@questoes = Questao.where("assunto_id = ? and concurso_id = ? ", @assunto, @concurso).order(:id).paginate(:page => params[:page], :per_page => 10)
    elsif (@materia)
    	@questoes = Questao.where("materia_id = ? ", @materia).order(:id).paginate(:page => params[:page], :per_page => 10)
    elsif (@assunto)
    	@questoes = Questao.where("assunto_id = ? ", @assunto).order(:id).paginate(:page => params[:page], :per_page => 10)
    elsif (@concurso)
    	@questoes = Questao.where("concurso_id = ? ", @concurso).order(:id).paginate(:page => params[:page], :per_page => 10)
    else
    	@questoes = Questao.first(100).paginate(:page => params[:page], :per_page => 10)
    end
  end

  def burndown
    if Burndown.first.blank?
      @burndown = Burndown.new
      @burndown.save
    else
      @burndown = Burndown.first
      unless params[:burndown].blank?
        @burndown.update_attributes(params[:burndown])
      end  
    end 

    @burndown.save
  end

  def dynamic_select_item
  	@questao = Questao.find(params[:id])
  	@gabarito = @questao.gabarito
  	
    if @questao.tipo == 'M'
      @resp = params[:resp]
      if @resp.size > 1
        @resp = ''
      end
    elsif @questao.tipo == 'C'
      @resp = params[:resp].split(',').map{|a| a.to_s}
    end

  	
  	@start = Time.zone.parse(params["start_time"])
  	@end = 0.second.ago
  	tempo_final = @end - @start
  	if user_signed_in?
  		@usuario = current_user
  	else
  		@usuario = User.find_by_email('default@localhost.com')
  	end
  	Resposta.create(:questao_id => @questao_id, :user_id => @usuario.id, :gabarito => @gabarito, :resposta => @resp, :tempo => tempo_final)

  	respond_to do |format|
      format.js
    end
  end

  def dynamic_get_comment

    @action = params[:op]

    @questao = Questao.find(params[:questao_id])
    unless params[:comment_id].blank?
      comment = Comment.find(params[:comment_id])
    end
    if(@action == 'D')
      if(comment.user == current_user and comment.questao == @questao)
        comment.destroy
        @comment_id = params[:comment_id]
      end
    end

    respond_to do |format|
      format.js
    end

  end

  def dynamic_add_comment
    @questao = Questao.find(params[:questao_id])
    comment = params[:comment]
    @comment_id = Comment.create!(:texto => comment, :questao_id => @questao.id, :user_id => current_user.id).id
    respond_to do |format|
      format.js
    end

  end

end
