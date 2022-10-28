require 'rails_helper'

RSpec.describe SaveEntries do

	let(:url) { Settings.scrapped_site }
	let(:xml_entries) { ScrapeSite.by(url: url) }
	let(:interactor) { SaveEntries.save(xml_entries: xml_entries) }

	context 'when fetching new entries' do

		context 'with correct params' do

			context 'when xml_entries has values' do
				before { interactor }
				it "saves the site entries" do
					expect(Entry.count).to eq xml_entries.count
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