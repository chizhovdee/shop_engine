class PagesController < ApplicationController
  def show
    @page = Page.find_by_alias(params[:alias])
  end

  def reviews

  end

  def search

  end

  def order_call
    if request.get?
      @order = OrderCall.new
      
      render :layout => false

    elsif request.post?
      @order = OrderCall.new(params[:order_call])

      @order.save
    end
  end

  def order_status
    new_order = false
    count_from_db = Order.with_state(:new).count + OrderCall.with_state(:new).count
    count_from_cache = Rails.cache.read("count_orders")

    if count_from_cache.nil?
      Rails.cache.write("count_orders", count_from_db, :expires_in => 1.hour)

    else
      new_order = true if count_from_db > count_from_cache
      
      Rails.cache.delete("count_orders")

      Rails.cache.write("count_orders", count_from_db, :expires_in => 1.hour)
        
    end

    render :json => {
      :new_order => new_order
    }
  end
end
