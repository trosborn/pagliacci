class GelatosController < ApplicationController
  before_action :set_gelato, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized, except: [:index, :show]

  def new
    @gelato = Gelato.new
    authorize @gelato, :new?
  end

  def index
    @gelatos = Gelato.all
  end

  def edit
    authorize @gelato, :edit?
  end

  def create
    @gelato = Gelato.new(gelato_params)
    respond_to do |format|
      if @gelato.save
        format.html { redirect_to @gelato, notice: 'Gelato was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
    authorize @gelato, :create?
  end

  def update
    respond_to do |format|
      if @gelato.update(gelato_params)
        format.html { redirect_to @gelato, notice: 'Gelato was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
    authorize @gelato, :update?
  end

  def destroy
    @gelato.destroy
    respond_to do |format|
      format.html { redirect_to gelatos_url }
    end
    authorize @gelato, :destroy?
  end

  def show
  end

private
  def gelato_params
    params.require(:gelato).permit(:name, :description, :dairy)
  end

  def set_gelato
    @gelato = Gelato.find(params[:id])
  end
end
