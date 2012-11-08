class ItensController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  before_filter :questao_presented

  def questao_presented
    unless params[:questao].blank?
      @questao = Questao.find(params[:questao]) #tratar pois pode dar erro
    else
      @questao = nil
    end  
  end
  
  # GET /itens
  # GET /itens.json
  def index
    @itens = Item.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @itens }
    end
  end

  # GET /itens/1
  # GET /itens/1.json
  def show
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
    end
  end

  # GET /itens/new
  # GET /itens/new.json
  def new
    @item = Item.new
    unless @questao.blank?
      @item.questao = @questao
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
    end
  end

  # GET /itens/1/edit
  def edit
    @item = Item.find(params[:id])
  end

  # POST /itens
  # POST /itens.json
  def create
    @item = Item.new(params[:item])

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item criado com sucesso.' }
        format.json { render json: @item, status: :created, location: @item }
      else
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /itens/1
  # PUT /itens/1.json
  def update
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to @item, notice: 'Item atualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /itens/1
  # DELETE /itens/1.json
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to itens_url }
      format.json { head :no_content }
    end
  end
end
