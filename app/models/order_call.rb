class OrderCall < ActiveRecord::Base
  attr_accessible :customer_comment, :customer_phone, :customer_name, :customer_email

  validates :customer_phone, :customer_name, :presence => true

  after_create :send_email

  state_machine :initial => :new do
    state :new
    state :accepted
    state :closed

    event :accept do
      transition :new => :accepted
    end

    event :close do
      transition [:accepted] => :closed
    end
  end

  def self.states
    [:new, :accepted, :closed]
  end


  private

    def send_email
      OrderMailer.new_order_call(self).deliver
    end
end
