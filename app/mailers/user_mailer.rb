class UserMailer < ApplicationMailer
	default from: 'scraper@papensen.com'

	def new_entry_email(entry:, subscriber:)
		@entry = entry
		@subscriber = subscriber

		mail_to = @subscriber.email
		mail(bcc: mail_to, subject: 'RatAlert - ' + entry.title)
	end

	def admin_email(error)
		@error = error
		mail(bcc: 'tomas@amalgama.co', subject: 'RatAlert Exception')
	end

	def claimed_email(entry:)
		@entry = entry
		mail(bcc: "tomas@amalgama.co", subject: 'Beneficio sacado! ' + entry.title)
	end


	def limited_reached_email(entry:)
		@entry = entry
		mail(bcc: "tomas@amalgama.co", subject: 'Carajito, llegamo al limite con ' + entry.title)
	end

end