#encoding=utf-8
class QuestoesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_itens
  load_and_authorize_resource :except => [:dynamic_select_assuntos]
  before_filter :debug_controller

  def get_itens
    unless params[:questao].blank?
      @itema = params[:questao][:itema] 
      @itemb = params[:questao][:itemb] 
      @itemc = params[:questao][:itemc] 
      @itemd = params[:questao][:itemd] 
      @iteme = params[:questao][:iteme] 

      unless (@itema.blank? and @itemb.blank? and @itemc.blank? and @itemd.blank? and @iteme.blank? )
        if @itema.blank? 
          @itema = 'não especificado...'
        end
        if @itemb.blank? 
          @itemb = 'não especificado...'
        end
        if @itemc.blank? 
          @itemc = 'não especificado...'
        end
        if @itemd.blank? 
          @itemd = 'não especificado...'
        end
        if @iteme.blank? 
          @iteme = 'não especificado...'
        end 
      end
      
      puts @itemc
      
      puts params[:questao]

      params[:questao].delete(:itema)
      params[:questao].delete(:itemb)
      params[:questao].delete(:itemc)
      params[:questao].delete(:itemd)
      params[:questao].delete(:iteme)
      
      puts params[:questao] 
    end
  end
  
  def debug_controller
    puts 'ok'
    puts params[:controller]
    puts params[:action]
  end
  
  # GET /questoes
  # GET /questoes.json
  def index
    @questoes = Questao.all

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

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @questao }
    end
  end

  # GET /questoes/1/edit
  def edit
    @questao = Questao.find(params[:id])
  end

  # POST /questoes
  # POST /questoes.json
  def create
    @questao = Questao.new(params[:questao])
    @questao.user = current_user

    unless @questao.valid?
      @questao.itens << Item.new(:desc => @itema, :questao_id => @questao)
      @questao.itens << Item.new(:desc => @itemb, :questao_id => @questao)
      @questao.itens << Item.new(:desc => @itemc, :questao_id => @questao)
      @questao.itens << Item.new(:desc => @itemd, :questao_id => @questao)
      @questao.itens << Item.new(:desc => @iteme, :questao_id => @questao)
    end

    respond_to do |format|
      if @questao.save
        unless (@itema.blank? and @itemb.blank? and @itemc.blank? and @itemd.blank? and @iteme.blank? )
          @questao.itens << Item.new(:desc => @itema, :questao_id => @questao.id)
          @questao.itens << Item.new(:desc => @itemb, :questao_id => @questao.id)
          @questao.itens << Item.new(:desc => @itemc, :questao_id => @questao.id)
          @questao.itens << Item.new(:desc => @itemd, :questao_id => @questao.id)
          @questao.itens << Item.new(:desc => @iteme, :questao_id => @questao.id)
          @questao.save
        end
        
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
end
