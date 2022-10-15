require 'rails_helper'
require 'contexts/for_models'


RSpec.describe SendEmailToSubscribers do

	let(:entry) { Entry.create!(title: 'El Candidado, Moldavsky 2019', site_id: 4355) }

	let!(:subscriber1) { create :subscriber }
	let!(:subscriber2) { create :subscriber }

	let(:send_emails) { SendEmailToSubscribers.for(entry: entry) }

	context 'with correct params' do
		include_examples 'SendEmailToSubscribers is succesful'

		context 'with correct params' do
			before {
				subscriber1.filters.create!(:name => 'moldavsky')
			}
			include_examples 'SendEmailToSubscribers is succesful but filtered'
		end
	end

end