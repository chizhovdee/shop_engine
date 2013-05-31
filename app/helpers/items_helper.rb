module ItemsHelper
  def item_status_icon(item)
    status = item_status(item)

    status.blank? ? nil : image_tag("#{ item_status(item) }.png", :class => "icon_status")
  end

  def item_status(item)
    result = ''
    statuses = [:action, :new, :hit, :discount]

    if item.is_a?(Item)
      result = statuses[0] if item.action?
      result = statuses[1] if item.new_item?
      result = statuses[2] if item.hit?
      result = statuses[3] if item.discount?
    else
      result = statuses[0] if item['action'] == 1
      result = statuses[1] if item['new_item'] == 1
      result = statuses[2] if item['hit'] == 1
      result = statuses[3] if item['discount'] == 1
    end

    result
  end
end