require 'rails_helper'

RSpec.describe SaveEntries do

	let(:xml_entries) { ScrapeSite.by(url: url) }
	let(:interactor) { SaveEntries.save(xml_entries: xml_entries) }

	context 'with correct params' do

		# it { expect(interactor).to be_a Nokogiri::XML::NodeSet }
		# it { expect(interactor).to all(be_a(Nokogiri::XML::Element)) }

		context 'without xml_entries' do
			let(:xml_entries) { nil }
			include_examples 'interactor raises an error', Error
		end

	end

end