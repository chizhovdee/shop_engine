class OrderMailer < ActionMailer::Base
  default from: "robot@toy-dream.ru"

  def new_order(order)
    @order = order
    mail(:to => Settings.order_email, :subject => I18n.t("orders.new.email.subject"))
  end
end
