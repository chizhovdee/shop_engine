class CategoriesController < ApplicationController
  def show
    @category = Category.find_by_alias(params[:alias])

    @child_categories = @category.child_categories.with_state(:visible).order(:position)

    @items = @category.items.paginate(
      :page => params[:page], 
      :per_page => 30, 
      :conditions => "state = 'visible'",
      :order => :position
    )

    @item_pictures = @items.any? ? ItemPicture.fetch_for_item_list( @items.collect{ |i| i["id"] } ) : []
   
    add_breadcrumb @category.parent_category.name, "/categories/#{@category.parent_category.alias}" if @category.parent_category
    add_breadcrumb @category.name, "/categories/#{@category.alias}"
  end
end