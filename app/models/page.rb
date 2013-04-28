class Page < ActiveRecord::Base
  has_one :info_block
  
  attr_accessible :title, :alias, :body

  validates :title, :alias, :body, :presence => true

  def self.for_dropdown
    all.collect{|p| [p.title, p.id]}
  end
end