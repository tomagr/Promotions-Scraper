require 'rails_helper'

RSpec.describe ClaimWishTickets do


	let!(:entry) { create :entry, title: "Lollapalooza 2023" }
	let!(:wish) { create :subscriber_wish, name: "lolla" }
	let(:interactor) { ClaimWishTickets.for(entry: entry) }

	context 'when claiming a ticket' do

		context 'with correct params' do

			it "updates the entry" do
				expect(interactor).to eq entry
			end

			# it 'expects params to be a BleapUserProduct' do
			# 	expect(interactor.send(:existing_subscriber_wish)).to eq true
			# end

		end
	end

	context 'with incorrect params' do

		context 'without a xml_entry' do
			let(:entry) { nil }
			include_examples 'interactor raises an error', Error
		end

	end
end
