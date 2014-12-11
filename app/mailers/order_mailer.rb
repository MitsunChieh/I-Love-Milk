class OrderMailer < ActionMailer::Base
  default from: "aga@ilovemilk.com.tw"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.confirm.subject
  #
  def confirm(user, order)
    @order = order

    mail(to: user.email, subject: "訂單成功")
  end
end
