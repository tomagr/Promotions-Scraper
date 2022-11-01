require 'rails_helper'

RSpec.describe ClaimTickets do


	let!(:entry) { create :entry, title: "Lollapalooza 2023" }
	let!(:wish) { create :subscriber_wish, name: "lolla" }
	let(:interactor) { ClaimTickets.for(entry: entry) }

	context 'when claiming a ticket' do

		context 'with correct params' do


		end
	end

	context 'with incorrect params' do

		context 'without a xml_entry' do
			let(:entry) { nil }
			include_examples 'interactor raises an error', Error
		end

	end
end
