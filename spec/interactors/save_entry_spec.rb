require 'rails_helper'

RSpec.describe SaveEntry do

	let(:url) { Settings.scrapped_site }
	let(:xml_entry) { ScrapeSite.by(url: url).first }
	let(:interactor) { SaveEntries.by(xml_entry: xml_entries) }

	context 'when fetching new entries' do

		context 'with correct params' do

			context 'when xml_entries has values' do
				it "saves the site entries" do
					expect(Entry.count).to > 0
				end
			end

		end

		context 'with incorrect params' do

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