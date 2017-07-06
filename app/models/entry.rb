class Entry < ApplicationRecord

  validates :title, presence: true
  validates :site_id, uniqueness: true


  def available?
    parsed_entry = find_by_site_id(site_id)
    parsed_entry.css('figcaption').present? and parsed_entry.css('figcaption').text == 'Reservá ahora'
  end

end
