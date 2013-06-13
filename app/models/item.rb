class Item < ActiveRecord::Base
  belongs_to :category, :counter_cache => :items_count

  has_many :item_pictures
  has_many :item_features

  has_many :orders

  has_one :special_offer, :as => :resource, :class_name => 'SpecialOffer'

  attr_accessible :action_available_till, :description, :body, :name, :price, :alias, :category_id,
    :articul, :additional, :video_url, :position, :action, :new_price, :new_item, :hit, :discount, :discount_available_till

  validates :name, :price, :body, :category_id, :position, :presence => true
  validates :position, :numericality => { :only_integer => true }

  state_machine :initial => :hidden do
    state :hidden
    state :visible

    event :publish do
      transition :hidden => :visible
    end

    event :hide do
      transition :visible => :hidden
    end
  end

  def self.states
    [:hidden, :visible]
  end

  def self.actions_dropdown
    find_all_by_action(true).collect{|p| [p.name, p.id]}
  end

  def self.find_all_for_index
    find_by_sql(send(:sanitize_sql,
      "SELECT id, name, articul, description, price, new_price, hit, action, discount, new_item FROM items 
       WHERE hit = 1 OR action = 1 OR discount = 1 OR new_item = 1"
    ))
  end
end