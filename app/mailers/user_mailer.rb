class UserMailer < ApplicationMailer
  default from: 'scraper@papensen.com'

  def new_entry_email(entry)

    @entry = entry
    mail_to = 'tomas@amalgama.co,smacagno@gmail.com,
                gonzalo@amalgama.co,florenciacharpentier@gmail.com,
                jose@amalgama.co'
    #mail_to = 'tomas@theamalgama.com'
    mail(to: mail_to, subject: 'RatAlert - ' + entry.title)
  end


end
