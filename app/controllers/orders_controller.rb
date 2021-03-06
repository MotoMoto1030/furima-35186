class OrdersController < ApplicationController
  before_action :item_find, only: [:index, :create]
  before_action :authenticate_user!
  before_action :order_root, only: [:index, :create]
  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :municipality, :address, :phone_number, :shipping_area_id, :building_name).merge(
      token: params[:token], item_id: params[:item_id], user_id: current_user.id
    )
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

  def order_root
    return redirect_to root_path if user_signed_in? && @item.user == current_user

    redirect_to root_path if user_signed_in? && @item.order.present?
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
