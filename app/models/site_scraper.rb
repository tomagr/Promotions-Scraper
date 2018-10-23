# == Schema Information
#
# Table name: site_scrapers
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'open-uri'

class SiteScraper < ApplicationRecord

	def self.scrape_by_url url
		doc = Nokogiri::HTML(open(url))
		entries = doc.css('.blog-post-item')
		parse_entries entries unless entries.nil?
	end

	def self.parse_entries entries
		entries.each do |entry|
			save_entry entry
		end
	end


	def self.save_entry entry
		#begin
		analize_entry entry
		# rescue NoMethodError => error
		# 	send_admin_error_email error
		# end
	end

	def self.analize_entry parsed_entry
		@parsed_entry = parsed_entry
		title = @parsed_entry.css('h2 a').text

		if title.present?
			site_id = parse_id_from_uri @parsed_entry.css('h2 a')[0]['href']
			status = @parsed_entry['data-condition']

			create_or_update title, status, site_id
		end
	end


	def self.create_or_update title, status, site_id

		if Entry.find_by_site_id(site_id).nil?
			create_entry title, status, site_id
		else
			update_entry status, site_id
		end
	end

	def self.create_entry title, status, site_id
		entry = Entry.create(:title => title, :status => status, :site_id => site_id)
		send_alert_if_available entry
	end

	def self.update_entry status, site_id
		entry = Entry.find_by_site_id site_id
		if entry.status != status
			entry.update_attributes(:status => status)
			send_alert_if_available entry
		end
	end

	def self.send_alert_if_available entry
		if entry.status == 'today' and is_entry_available?
			write_to_console entry
			UserMailer.new_entry_email(entry).deliver_now
		end
	end

	def self.write_to_console entry
		Rails.logger = Logger.new(STDOUT)
		puts "Email sent for ====> #{entry.title} \n"
	end

	def self.send_admin_error_email error
		if Time.now > $last_admin_email_time + 1.day
			UserMailer.admin_email(error).deliver_now
			$last_admin_email_time = Time.now
		end
	end

	def self.parse_id_from_uri uri
		uri.gsub("/experiencia/", "").to_i
	end

	def self.is_entry_available?
		# figcaption element contains the 'Reservá ahora' text
		@parsed_entry.css('figcaption').present? #and entry.css('figcaption').text == 'Reservá ahora'
	end

end
