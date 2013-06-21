class Review < ActiveRecord::Base
  attr_accessible :body, :city, :name, :office, :phone, :picture, :site, :state
end
