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

    # And doesn't exists on DB?
    if is_available? entry and Entry.find_by_site_id(site_id).nil?
      entry = Entry.create(:title => title, :status => status, :site_id => site_id)
      UserMailer.new_entry_email(entry).deliver_now if entry.status.blank?
    end

  end

  def self.parse_id_from_uri uri
    uri.gsub("/experiencia/", "").to_i
  end


  def self.is_available? entry
    entry.css('figcaption').present? and entry.css('figcaption').text == 'Reservá ahora'
  end

end
