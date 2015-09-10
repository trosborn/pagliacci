class SaladsController < ApplicationController
  before_action :set_salad, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized, except: [:index, :show]

  def index
    @salads = Salad.all
  end

  def show
  end

  def new
    @salad = Salad.new
    authorize @salad, :new?
  end

  def edit
    authorize @salad, :edit?
  end

  def create
    @salad = Salad.new(salad_params)
    respond_to do |format|
      if @salad.save
        format.html { redirect_to @salad, notice: 'Salad was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
    authorize @salad, :create?
  end

  def update
    respond_to do |format|
      if @salad.update(salad_params)
        format.html { redirect_to @salad, notice: 'Salad was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
    authorize @salad, :update?
  end

  def destroy
    @salad.destroy
    respond_to do |format|
      format.html { redirect_to salads_url }
    end
    authorize @salad, :destroy?
  end

  private
  def set_salad
    @salad = Salad.find(params[:id])
  end

  def salad_params
    params.require(:salad).permit(:name, :small_price, :medium_price, :large_price)
  end
end
