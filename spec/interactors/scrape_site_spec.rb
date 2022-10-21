require 'rails_helper'

RSpec.describe ScrapeSite do

	let(:url) { Settings.scrapped_site }
	let(:interactor) { ScrapeSite.by(url: url) }

	context 'with correct params' do

		it { expect(interactor).to be_a Nokogiri::XML::NodeSet }
		it { expect(interactor).to all(be_a(Nokogiri::XML::Element)) }

		context 'without url' do
			let(:url) { nil }
			include_examples 'interactor raises an error', Error
		end

		context 'with empty url' do
			let(:url) { '' }
			include_examples 'interactor raises an error', Error
		end

		context 'when url does not exists' do
			let(:url) { 'https://noentries.cc' }
			include_examples 'interactor raises an error', SocketError
		end

		context 'when url has no entries' do
			let(:url) { 'https://www.iproup.com' }
			# it { expect(interactor).to be_empty }
			it { expect(interactor).to be 88 }
		end

	end

end