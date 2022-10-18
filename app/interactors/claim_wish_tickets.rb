require "i18n"

class ClaimWishTickets < Interactor
	validates :entry, presence: true

	def self.for(entry:)
		send_alert = new(entry: entry)
		send_alert.execute
	end

	def initialize(entry:)
		@entry = entry
	end

	def execute
		wish = existing_subscriber_wish
		claim_tickets wish if wish.present?
	end

	private

	def existing_subscriber_wish
		wishes_titles = SubscriberWish.all.map(&:name)
		wishes_titles.any? do |wish_title|
			return SubscriberWish.where(name: wish_title).first if @entry.title.downcase.include?(wish_title)
		end
	end

	def claim_tickets wish

		10.times do |n|
			console_log "Claiming ticket INTENT ##{n} for ====> #{@entry.title} \n"

			response = ClaimTickets.for(entry: @entry)
			console_log "Claim response: #{response}"

			if claimed_success response
				wish.update_attributes!(:response => response)
				break
			end

			if limit_reached response
				wish.update_attributes!(:response => response, claimed: true)
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

end