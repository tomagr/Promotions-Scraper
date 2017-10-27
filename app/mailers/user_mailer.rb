class UserMailer < ApplicationMailer
  default from: 'scraper@papensen.com'

  def new_entry_email(entry)

	 #emails = ['tomas@amalgama.co', 'smacagno@gmail.com',
	 #			  'rmacagno@hotmail.com', 'lilitogni29@hotmail.com',
	 #			  'rodrigorueda@live.com', 'Luzz.t@hotmail.com']
	 #emails.each { |email| mail(to: email, subject: 'RatAlert - ' + entry.title) }


	 @entry = entry
	 mail_to = 'tomas@amalgama.co,smacagno@gmail.com,rmacagno@hotmail.com,lilitogni29@hotmail.com'
	 #mail_to = 'tomas@theamalgama.com'
	 mail(bcc: mail_to, subject: 'RatAlert - ' + entry.title)
  end


end
