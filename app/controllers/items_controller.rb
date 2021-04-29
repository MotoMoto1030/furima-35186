class ItemsController < ApplicationController
  def index
    @items = Item.all.order(id: "DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_description, :price, :item_status_id, :shipping_charge_id, :shipping_area_id,
                                 :category_id, :days_to_ship_id).merge(user_id: current_user.id)
  end
end
