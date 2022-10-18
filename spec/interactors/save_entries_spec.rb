require 'rails_helper'

RSpec.describe SaveEntries do

	let(:url) { Settings.scrapped_site }
	let(:xml_entries) { ScrapeSite.by(url: url) }
	let(:interactor) { SaveEntries.save(xml_entries: xml_entries) }

	context 'with correct params' do

		context 'xml_entries' do

			it{
				# byebug
			}
		end


	end


	context 'with incorrect params' do
		#
		# context 'without xml_entries' do
		# 	let(:xml_entries) { nil }
		# 	include_examples 'interactor raises an error', Error
		# end
		#
		# context 'without xml_entries' do
		# 	let(:xml_entries) { nil }
		# 	include_examples 'interactor raises an error', Error
		# end

	end

end