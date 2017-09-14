class UserMailer < ApplicationMailer
  default from: 'scraper@papensen.com'

  def new_entry_email(entry)

	 @entry = entry
	 emails = [
		  'tomas@amalgama.co',
		  'smacagno@gmail.com',
		  'rmacagno@hotmail.com',
		  'lilitogni29@hotmail.com',
		  'rodrigorueda@live.com',
		  'Luzz.t@hotmail.com'
	 ]

	 emails.each { |email| mail(to: email, subject: 'RatAlert - ' + entry.title) }
  end


end
