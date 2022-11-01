require "i18n"

class ClaimWishTickets < BaseInteractor
	validates :xml_entry, presence: true

	def self.for(xml_entry:)
		send_alert = new(xml_entry: xml_entry)
		send_alert.execute
	end

	def initialize(xml_entry:)
		@xml_entry = xml_entry
	end

	def execute
		invalid_xml_entry @xml_entry

		
		wish = existing_subscriber_wish
		claim_tickets wish if wish.present?
	end

	private

	def existing_subscriber_wish
		wishes_titles = SubscriberWish.all.map(&:name)
		wishes_titles.any? do |wish_title|
			return SubscriberWish.where(name: wish_title).first if @xml_entry.title.downcase.include?(wish_title)
		end
	end

	def claim_tickets wish

		10.times do |n|
			console_log "Claiming ticket INTENT ##{n} for ====> #{@xml_entry.title} \n"
			response = ClaimTickets.for(entry: @entry)
			console_log "Claim response: #{response}"

			if claimed_success response
				wish.update!(:response => response)
				send_claimed_email_for @entry
				break
			end

			if limit_reached response
				wish.update!(:response => response, claimed: true)
				break
			end
		end
	end

	def claimed_success response
		I18n.transliterate(response.downcase).include?("felicitaciones")
	end

	def limit_reached response
		I18n.transliterate(response.downcase).include?("superaste el limite")
	end

	def send_claimed_email_for entry
		SendClaimedEmail.for(entry: entry)
	end

	def send_limited_reached_email_for entry
		SendClaimedEmail.for(entry: entry)
	end

end