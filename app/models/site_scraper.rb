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
    title = entry.css('h2 a').text
    site_id = parse_id_from_uri entry.css('h2 a')[0]['href']
    status = entry.css('ul li span').text


    entry = Entry.find_by_site_id(site_id)
    if entry.nil?
      #Notify if new entry status changed to Available
      entry = Entry.create(:title => title, :status => status, :site_id => site_id)
      UserMailer.new_entry_email(entry).deliver_now if entry.status.blank?

    else
      #Notify if status changed to Available
      UserMailer.new_entry_email(entry).deliver_now if status.blank? and !entry.status.blank?
      entry.update(status: status)
    end

  end

  def self.parse_id_from_uri uri
    uri.gsub("/experiencia/", "").to_i
  end
end
