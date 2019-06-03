require 'rails_helper'
require 'contexts/for_models'

RSpec.shared_examples 'EntryIsFilteredBySubscriber is succesful' do
	it 'the entry is filtered by the tags' do
		expect (filtered_result).to be true
		expect (filtered_result).to change { ActionMailer::Base.deliveries.count }.by(0)
	end
end

RSpec.shared_examples 'EntryIsFilteredBySubscriber raise error' do |error|
	it { expect (filtered_result ).to raise_exception error }
end

RSpec.describe EntryIsFilteredBySubscriber do

	include_context 'create subscriber'

	let(:entry) { Entry.create!(title: 'El Candidado, Moldavsky 2019', site_id: 4355) }

	before {
		subscriber.filters.create!(:name => 'Moldavsky')
		subscriber.filters.create!(:name => 'lechuga')
	}

	let(:filtered_result) {
		EntryIsFilteredBySubscriber.for(
				entry: entry,
				subscriber: subscriber
		)
	}

	context 'with correct params' do
		include_examples 'EntryIsFilteredBySubscriber is succesful'
	end

end
