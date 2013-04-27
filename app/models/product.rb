class Product < ActiveRecord::Base
  belongs_to :category

  has_many :product_pictures
  has_many :product_features

  attr_accessible :action_available_till, :action_price, :description, :name, :price, :alias, :category_id,
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

end