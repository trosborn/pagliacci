class SaladsController < ApplicationController
  before_action :set_salad, only: [:show, :edit, :update, :destroy]
  before_action :set_toppings, only: [:new, :create, :edit, :update]
  after_action :verify_authorized, except: [:index, :show]


  def index
    @salads = Salad.all
  end

  def show
  end

  def new
    @salad = Salad.new
    authorize @salad
  end

  def edit
    authorize @salad
  end

  def create
    @salad = Salad.new(salad_params)
    authorize @salad
    respond_to do |format|
      if @salad.save
        format.html { redirect_to @salad, notice: 'Salad was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    authorize @salad
    @salad.attributes = { 'topping_ids' => []}.merge(salad_params.except(:sizes_attributes) || {} )
    respond_to do |format|
      if @salad.update(salad_params)
        format.html { redirect_to @salad, notice: 'Salad was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    authorize @salad
    @salad.destroy
    respond_to do |format|
      format.html { redirect_to salads_url, notice: 'Salad was successfully destroyed.' }
    end
  end

private
  def set_toppings
    @toppings = Topping.all
  end

  def set_salad
    @salad = Salad.find(params[:id])
  end

  def salad_params
    params.require(:salad).permit(:name, sizes_attributes: [:name, :price, :id, :_destroy], :topping_ids => [])
  end
end
