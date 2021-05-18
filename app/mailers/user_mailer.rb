class UserMailer < ApplicationMailer
  default from: 'vocal4.lamousaille@gmail.com'

  def welcome_email(user)
    @user = user
    @url = 'http://company.com/login'
    mail(to: @user.email, subject: "Bienvenue sur cette contrefaçon Hong Kongaise d'eventbrite !")
  end

  def event_inscription_email(user, event)
    @user = user
    @event = event
    mail(to: @user.email, subject: "Voici votre réservation !")
  end
end
