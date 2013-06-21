module ApplicationHelper
  def admin_state(resource)
    text = ""

    resource.class.states.each do |state|
      if resource.state == state.to_s
        text << "<span class='status_tag #{ resource.state } #{ :complete if resource.state == 'visible' }'>#{ resource.state }</span>"
      else
        text << link_to(state, polymorphic_url([:change_state, :admin, resource], :state => state), :remote => true, :method => :put)
      end

      text << "<br />"
    end

    text.html_safe
  end

  def admin_place_keys
    [[:sidebar, :sidebar], [:top, :top]]
  end

  def meta_title(text = '')
    text.blank? ? t(".app_title") : "#{ text } | #{ t(".app_title") }"
  end

  def title(text)
    content_for(:title){text}

    text
  end

  def fetch_info_blocks(place)
    SpecialOffer.with_state(:visible).order(:position).find_all_by_place(place) +
    InfoBlock.with_state(:visible).find_all_by_place(place)
  end

  def info_block_picture(info_block)
    if info_block.is_a?(SpecialOffer)
      if info_block.picture? and info_block.item
        link_to(image_tag(info_block.picture.url), "/items/#{info_block.item_id}")
      elsif info_block.item
        link_to(image_tag(info_block.item.item_pictures.where(:main => true).first.picture.url(:small)), "/items/#{info_block.item_id}")
      else
        link_to(image_tag(info_block.picture.url), page_url(info_block.page))
      end
    else
      link_to(image_tag(info_block.picture.url), page_url(info_block.page))
    end
  end

  def info_block_link(info_block)
    if info_block.is_a?(SpecialOffer)
      if info_block.picture? and info_block.item
        link_to(info_block.text_link, "/items/#{info_block.item_id}", :class => "info_block_link")
      elsif info_block.item
        link_to(info_block.text_link, "/items/#{info_block.item_id}", :class => "info_block_link")
      else
        link_to(info_block.text_link, page_url(info_block.page))
      end
    else
      link_to(info_block.text_link, page_url(info_block.page))
    end
  end
end
