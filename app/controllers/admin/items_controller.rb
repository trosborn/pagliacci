class Admin::ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_toppings, only: [:new, :create, :edit, :update]
  after_action :verify_authorized, except: [:index, :show]

  def index
    @items = Item.all
  end

  def show
  end

  def new
    @item = Item.new
    authorize @item, :admin_new?
  end

  def edit
    authorize @item, :admin_edit?
  end

  def create
    @item = Item.new(item_params)
    authorize @item, :admin_create?
    respond_to do |format|
      if @item.save
        format.html { redirect_to admin_item_path(@item), notice: 'Item was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    authorize @item, :admin_update?
    @item.attributes = { 'topping_ids' => []}.merge(item_params.except(:sizes_attributes) || {} )
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to admin_item_path(@item), notice: 'Item was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    authorize @item, :admin_destroy?
    @item.destroy
    respond_to do |format|
      format.html { redirect_to admin_items_path, notice: 'Item was successfully destroyed.' }
    end
  end

private
  def set_toppings
    @toppings = Item.toppings
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :kind, :qualifier, :size_selection, :order_id, :active,
      sizes_attributes: [:name, :price, :half_price, :id, :_destroy],
      sides_attributes: [{side1: {topping_ids: []}}])
  end
end
