class UserMailer < ApplicationMailer
  default from: 'scraper@papensen.com'

  def new_entry_email(entry)

	 @entry = entry
	 mail_to = 'tomas@amalgama.co,smacagno@gmail.com,rmacagno@gmail.com,lilitogni29@hotmail.com,josetedin@gmail.com,agus_mllobet@hotmail.com'
	 #mail_to = 'tomas@theamalgama.com'
	 mail(bcc: mail_to, subject: 'RatAlert - ' + entry.title)
  end

  def admin_email(error)
	 @error = error
	 mail(bcc: 'tomas@amalgama.co', subject: 'RatAlert Exception')
  end

end
