class Page < ActiveRecord::Base
  has_one :info_block
  
  attr_accessible :title, :alias, :body, :position, :service

  validates :title, :alias, :presence => true

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

  def self.for_dropdown
    all.collect{|p| [p.title, p.id]}
  end
end