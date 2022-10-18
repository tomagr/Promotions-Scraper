require 'rails_helper'

RSpec.describe SaveEntries do

	let(:url) { Settings.scrapped_site }
	let(:xml_entries) { ScrapeSite.by(url: url) }

	context 'when fetching new entries' do


		context 'with correct params' do
			before { SaveEntries.save(xml_entries: xml_entries) }

			context 'when xml_entries has values' do
				it "saves the site entries" do
					expect(Entry.count).to be > 0
				end
			end

		end

		context 'with incorrect params' do
			before { SaveEntries.save(xml_entries: xml_entries) }

			context 'without xml_entries' do
				let(:xml_entries) { nil }
				include_examples 'interactor raises an error', Error
			end

			context 'with xml_entries empty' do
				let(:xml_entries) { [] }
				include_examples 'interactor raises an error', Error
			end

		end
	end

end