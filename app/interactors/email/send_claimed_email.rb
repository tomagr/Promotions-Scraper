class SendClaimedEmail < SendEntryEmail

	private

	def send_email entry
		console_log "CLAIMED Email sent for ====> #{entry.title}"
		UserMailer.claimed_email(entry: entry).deliver_now
	end


end