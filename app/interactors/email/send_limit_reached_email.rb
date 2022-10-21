class SendLimitReachedEmail < SendEntryEmail

	private

	def send_email entry
		console_log "LIMITED REACHED Email sent for ====> #{entry.title}"
		UserMailer.limited_reached_email(entry: entry).deliver_now
	end


end