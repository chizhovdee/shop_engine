class HomeController < ApplicationController
  def index
    @items = Item.find_all_for_index.shuffle

    @item_pictures = ItemPicture.fetch_for_item_list( @items.collect{ |i| i["id"] } )
  end
end
