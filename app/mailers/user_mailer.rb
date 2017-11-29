class UserMailer < ApplicationMailer

  def receive_like(user)
    @user = user
    @url = 'http://localhost:3000/'
    mail(to: @user.email, subject: "You've receive a notification")
  end

  def receive_unlike(user)
    @user = user
    @url = 'http://localhost:3000/'
    mail(to: @user.email, subject: "You've receive a notification")
  end

end
