require 'rails_helper'
require 'contexts/for_models'

RSpec.describe SaveEntries do

	let(:url) { Settings.scrapped_site }
	let(:interactor) { ScrapeSite.by(url: url) }

	context 'with correct params' do

		it { expect(interactor).to be_a Nokogiri::XML::NodeSet }
		it { expect(interactor).to all(be_a(Nokogiri::XML::Element)) }

		context 'without url' do
			let(:url) { nil }
			include_examples 'interactor raises an error'
		end

		context 'with empty url' do
			let(:url) { '' }
			include_examples 'interactor raises an error'
		end

	end

end