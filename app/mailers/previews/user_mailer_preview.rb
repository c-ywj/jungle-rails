class UserMailerPreview < ActionMailer::Preview

  def order_email
    order = Order.last
    UserMailer.order_email(order)
  end
end