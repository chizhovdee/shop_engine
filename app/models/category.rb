class Category < ActiveRecord::Base
  has_many :items
  belongs_to  :parent_category, :class_name => "Category"
  has_many    :child_categories, :class_name => "Category", :foreign_key => "parent_category_id", :dependent => :destroy

  attr_accessible :description, :name, :alias, :position, :parent_category_id

  validates :name, :alias, :position, :presence => true

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
