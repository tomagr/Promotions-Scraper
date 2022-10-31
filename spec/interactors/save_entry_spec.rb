require 'rails_helper'

RSpec.describe SaveEntry do

	let(:url) { Settings.scrapped_site }
	let(:xml_entries) { ScrapeSite.by(url: url) }
	let(:xml_entry) { xml_entries[1] }

	let!(:entry) { create :entry }
	let(:interactor) { SaveEntry.by(xml_entry: xml_entry, last_id: entry.site_id) }

	context 'when fetching new entries' do

		context 'with correct params' do

			context 'when saving an existing entry' do

				it "updates the entry" do
					expect { interactor }.to change { Entry.count }
				end
			end
		end

		context 'with incorrect params' do

			context 'without a xml_entry' do
				let(:xml_entry) { nil }
				include_examples 'interactor raises an error', Error
			end

		end
	end

end