require 'open-uri'

class Scraper < ApplicationRecord

  def self.scrape_by_url url
    doc = Nokogiri::HTML(open(url))
    entries = doc.css('.blog-post-item')
    save_entries entries unless entries.nil?
  end

  def self.save_entries entries
    entries.each do |entry|
      title = entry.css('h2 a').text
      site_id = parse_id_from_uri entry.css('h2 a')[0]['href']
      status = entry.css('ul li span').text


      #if Entry.find_by_site_id(site_id).nil?
      if site_id == 12049
        entry = Entry.create(:title => title, :status => status, :site_id => site_id)
        UserMailer.new_entry_email(entry).deliver_now
      end
    end
  end

  def self.parse_id_from_uri uri
    uri.gsub("/experiencia/", "").to_i
  end
end
