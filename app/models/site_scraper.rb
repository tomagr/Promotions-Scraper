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
	 begin
		analize_entry entry
	 rescue NoMethodError => error
		send_admin_error_email error
	 end
  end

  def self.analize_entry entry
	 title = entry.css('h2 a').text
	 if title.present?
		site_id = parse_id_from_uri entry.css('h2 a')[0]['href']
		status = entry.css('ul li span').text

		# And doesn't exists on DB?
		if is_available? entry and Entry.find_by_site_id(site_id).nil?
		  entry = Entry.create(:title => title, :status => status, :site_id => site_id)
		  UserMailer.new_entry_email(entry).deliver_now if entry.status.blank?
		end
	 end
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


  def self.is_available? entry
	 entry.css('figcaption').present? #and entry.css('figcaption').text == 'Reservá ahora'
  end

end
