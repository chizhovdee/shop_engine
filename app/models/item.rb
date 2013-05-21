class Item < ActiveRecord::Base
  belongs_to :category

  has_many :item_pictures
  has_many :item_features

  has_one :special_offer, :as => :resource, :class_name => 'SpecialOffer'

  attr_accessible :action_available_till, :action_price, :description, :body, :name, :price, :alias, :category_id,
    :articul, :additional, :video_url, :position, :action

  validates :name, :price, :articul, :description, :category_id, :alias, :position, :presence => true
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
end