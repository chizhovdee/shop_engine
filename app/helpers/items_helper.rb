module ItemsHelper
  def item_status_icon(item)
    status = item_status(item)

    status.blank? ? nil : image_tag("#{ item_status(item) }.png", :class => "icon_status")
  end

  def item_status(item)
    result = ''
    statuses = [:action, :new, :hit, :discount]

    result = statuses[0] if item.action?
    result = statuses[1] if item.new_item?
    result = statuses[2] if item.hit?
    result = statuses[3] if item.discount?

    result
  end

  def item_order_button(item, type = nil)
     %{ 
        <a href="/items/#{ item.id }/order" class="btn #{ "btn-small" if type == :small } btn-danger order various fancybox.ajax">
          #{ t(".buttons.order") }
        </a> 
      }.html_safe
  end
end