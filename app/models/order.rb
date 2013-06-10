class Order < ActiveRecord::Base
  belongs_to :item

  attr_accessible :customer_address, :customer_comment, :customer_phone, :item_id, :customer_name, :customer_email

  validates :customer_phone, :item_id, :customer_name, :presence => true

  after_create :send_email

  state_machine :initial => :new do
    state :new
    state :accepted
    state :in_processing
    state :postponed
    state :closed
    state :ignored

    event :accept do
      transition :new => :accepted
    end

    event :mark_in_processing do
      transition [:postponed, :accepted] => :in_processing
    end

    event :postpone do 
      transition [:new, :accepted, :in_processing] => :postponed
    end

    event :ignore do
      transition [:new, :accepted, :in_processing, :postponed] => :ignored
    end

    event :close do
      transition [:postponed, :in_processing] => :closed
    end
  end

  def self.states
    [:new, :accepted, :in_processing, :postponed, :closed, :ignored]
  end


  private

    def send_email
      OrderMailer.new_order(self).deliver
    end

end
