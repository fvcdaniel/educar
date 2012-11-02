class AssuntosController < ApplicationController
  before_filter :authenticate_user! #unless Rails.env.test?
  load_and_authorize_resource #unless Rails.env.test?

  # GET /assuntos
  # GET /assuntos.json
  def index
    @assuntos = Assunto.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @assuntos }
    end
  end

  # GET /assuntos/1
  # GET /assuntos/1.json
  def show
    @assunto = Assunto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @assunto }
    end
  end

  # GET /assuntos/new
  # GET /assuntos/new.json
  def new
    @assunto = Assunto.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @assunto }
    end
  end

  # GET /assuntos/1/edit
  def edit
    @assunto = Assunto.find(params[:id])
  end

  # POST /assuntos
  # POST /assuntos.json
  def create
    @assunto = Assunto.new(params[:assunto])

    respond_to do |format|
      if @assunto.save
        format.html { redirect_to @assunto, notice: 'Assunto criado com sucesso.' }
        format.json { render json: @assunto, status: :created, location: @assunto }
      else
        format.html { render action: "new" }
        format.json { render json: @assunto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /assuntos/1
  # PUT /assuntos/1.json
  def update
    @assunto = Assunto.find(params[:id])

    respond_to do |format|
      if @assunto.update_attributes(params[:assunto])
        format.html { redirect_to @assunto, notice: 'Assunto atualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @assunto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assuntos/1
  # DELETE /assuntos/1.json
  def destroy
    @assunto = Assunto.find(params[:id])
    @assunto.destroy

    respond_to do |format|
      format.html { redirect_to assuntos_url }
      format.json { head :no_content }
    end
  end
end
