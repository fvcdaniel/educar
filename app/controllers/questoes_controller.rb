#encoding=utf-8
class QuestoesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource :except => [:dynamic_select_assuntos, :dynamic_add_item]
  
  # GET /questoes
  # GET /questoes.json
  def index
    @questoes = Questao.paginate(:page => params[:page], :per_page => 30)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @questoes }
    end
  end

  # GET /questoes/1
  # GET /questoes/1.json
  def show
    @questao = Questao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @questao }
    end
  end

  # GET /questoes/new
  # GET /questoes/new.json
  def new
    @questao = Questao.new
    session['questao_itens'] = Array.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @questao }
    end
  end

  # GET /questoes/1/edit
  def edit
    @questao = Questao.find(params[:id])
    session['questao_itens'] = @questao.itens.collect{|i| i.desc}
  end

  # POST /questoes
  # POST /questoes.json
  def create
    @questao = Questao.new(params[:questao])
    @questao.user = current_user
    @questao.questao_itens = session['questao_itens']

    respond_to do |format|
      if @questao.save
        session['questao_itens'].each do |i|
          @questao.itens << Item.new(:desc => i, :questao_id => @questao.id)
        end
        @questao.save
        session['questao_itens'] = nil
        format.html { redirect_to @questao, notice: 'Questão criada com sucesso.' }
        format.json { render json: @questao, status: :created, location: @questao }
      else
        puts @questao.errors.to_xml
        format.html { render action: "new" }
        format.json { render json: @questao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /questoes/1
  # PUT /questoes/1.json
  def update
    @questao = Questao.find(params[:id])
    @questao.questao_itens = session['questao_itens']

    respond_to do |format|
      if @questao.update_attributes(params[:questao])
        format.html { redirect_to @questao, notice: 'Questão atualizada com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @questao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questoes/1
  # DELETE /questoes/1.json
  def destroy
    @questao = Questao.find(params[:id])
    @questao.destroy

    respond_to do |format|
      format.html { redirect_to questoes_url }
      format.json { head :no_content }
    end
  end

  def dynamic_select_assuntos
    if can? :create, Questao
      @materia = Materia.find(params[:id])
    end 
    respond_to do |format|
      format.js
    end
  end

  def dynamic_add_item

    @itens = session['questao_itens']

    unless params['questao_id'].blank?
      @questao = Questao.find(params['questao_id'].to_i)
      unless params['op'].blank?  
        unless @questao.itens[params['item_index'].to_i].blank?
          @questao.itens.delete @questao.itens[params['item_index'].to_i]
          @questao.save
        end
      end
    end

    unless params['op'].blank?
      @itens.delete @itens[params['item_index'].to_i]
    else
      if @itens.include? params['item_desc']
        @alert = 'já existe um item com este valor'
      else
        @itens << params['item_desc']
        unless @questao.blank?
          @questao.itens << Item.new(:desc => params['item_desc'], :questao_id => @questao.id)
        end
      end
    end  
    
    respond_to do |format|
      format.js
    end
  end

end
