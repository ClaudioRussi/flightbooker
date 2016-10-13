class PassengerMailer < ApplicationMailer
  default from: 'segundo7claudiorussi@gmail.com'

  def thank_you_email(passenger)
    @passenger = passenger
    mail(to: @passenger.email, subject: 'You have bought a ticket')
  end
end
