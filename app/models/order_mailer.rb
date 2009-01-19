class OrderMailer < ActionMailer::Base

 def order_email(order, settings)
    @recipients = settings.email_to
    @from = settings.email_from
    @subject = "Bestellung"

    body[:order] = order
  end

 def confirmation_email(order, settings)
    @recipients = order.email
    @from = settings.email_from
    @subject = "Bestellung"

    body[:order] = order
  end
end

