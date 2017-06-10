class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def order_confirmation(user, order)
    @user = user
    @order = order
    mail(to: user.email, subject: 'Order has been received')
  end

end
