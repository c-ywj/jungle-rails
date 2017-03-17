class UserMailer < ApplicationMailer

  default from: 'no-reply@jungle.com'

  def order_email(order)
    @order = order
    @url  = 'http://example.com/login'
    mail(to: 'c_y4n@hotmail.com', subject: @order.id)
  end

end
