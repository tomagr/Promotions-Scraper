class UserMailer < ApplicationMailer
  default from: 'scraper@papensen.com'

  def new_entry_email(entry)

    @entry = entry
    mail_to = 'tomas@theamalgama.com,smacagno@gmail.com'
    #mail_to = 'agrimbautomas@gmail.com'
    mail(to: mail_to, subject: 'RatAlert - ' + entry.title)
  end


end
