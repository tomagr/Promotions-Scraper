# == Schema Information
#
# Table name: entries
#
#  id          :integer          not null, primary key
#  available   :boolean          default(FALSE)
#  email_sent  :boolean          default(FALSE)
#  featured    :boolean          default(FALSE)
#  released_at :datetime
#  status      :string(255)
#  title       :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  site_id     :integer
#

class Entry < ApplicationRecord

	validates :title, presence: true
	validates :site_id, uniqueness: true


	def site_link
		'http://experienciasblack.lanacion.com.ar/experiencia/' + site_id.to_s
	end

	# def available?
	# 	parsed_entry = find_by_site_id(site_id)
	# 	parsed_entry.css('figcaption').present? and parsed_entry.css('figcaption').text == 'Reservá ahora'
	# end

	def has_not_sent_email
		!self.email_sent
	end

	scope :available, -> {
		where('status != "this_week"')
			.where('status != "coming"')
			.where('status != "outofstock"')
			.where('created_at > ?', Date.today - 7.days)
	}


end
