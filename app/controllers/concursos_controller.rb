class ConcursosController < ApplicationController
  before_filter :authenticate_user! 
  before_filter :check_banca, :only=>[:create, :update]
  load_and_authorize_resource 
  autocomplete :banca, :nome
  

  def check_banca
    banca ||= Banca.find_by_nome(params[:concurso][:banca])
    if banca.blank? and !params[:concurso][:banca].blank?
      banca = Banca.create(:nome => params[:concurso][:banca])
    end
    unless banca.blank?
      params[:concurso][:banca_id] = banca.id
    end
    params[:concurso].delete "banca"
    puts params
  end

  # GET /concursos
  # GET /concursos.json
  def index
    @concursos = Concurso.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @concursos }
    end
  end

  # GET /concursos/1
  # GET /concursos/1.json
  def show
    @concurso = Concurso.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @concurso }
    end
  end

  # GET /concursos/new
  # GET /concursos/new.json
  def new
    @concurso = Concurso.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @concurso }
    end
  end

  # GET /concursos/1/edit
  def edit
    @concurso = Concurso.find(params[:id])
  end

  # POST /concursos
  # POST /concursos.json
  def create
    @concurso = Concurso.new(params[:concurso])

    respond_to do |format|
      if @concurso.save
        format.html { redirect_to @concurso, notice: 'Concurso criado com sucesso.' }
        format.json { render json: @concurso, status: :created, location: @concurso }
      else
        format.html { render action: "new" }
        format.json { render json: @concurso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /concursos/1
  # PUT /concursos/1.json
  def update
    @concurso = Concurso.find(params[:id])

    respond_to do |format|
      if @concurso.update_attributes(params[:concurso])
        format.html { redirect_to @concurso, notice: 'Concurso atualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @concurso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /concursos/1
  # DELETE /concursos/1.json
  def destroy
    @concurso = Concurso.find(params[:id])
    @concurso.destroy

    respond_to do |format|
      format.html { redirect_to concursos_url }
      format.json { head :no_content }
    end
  end
end
