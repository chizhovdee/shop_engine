class ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
    @pictures = @item.item_pictures.order("main DESC")
  end

  def order
    @item = Item.find(params[:id])

    if request.get?
      @order = @item.orders.build
      
      render :layout => false

    elsif request.post?
      @order = @item.orders.build(params[:order])

      @order.save
    end
  end
end