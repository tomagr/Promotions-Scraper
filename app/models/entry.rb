# == Schema Information
#
# Table name: entries
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  status     :string(255)
#  site_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Entry < ApplicationRecord

	validates :title, presence: true
	validates :site_id, uniqueness: true


	def site_link
		'http://experienciasblack.lanacion.com.ar/experiencia/' + site_id.to_s
	end

	def available?
		parsed_entry = find_by_site_id(site_id)
		parsed_entry.css('figcaption').present? and parsed_entry.css('figcaption').text == 'Reservá ahora'
	end

end
