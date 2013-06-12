class OrderMailer < ActionMailer::Base
  default from: "robot@toy-dream.ru"

  def new_order(order)
    @order = order
    mail(:to => Settings.order_email, :subject => I18n.t("orders.new.email.subject"))
  end

  def new_order_call(order)
    @order = order
    mail(:to => Settings.order_call_email, :subject => I18n.t("orders.new_call.email.subject"))
  end
end
