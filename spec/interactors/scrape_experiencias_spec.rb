require 'rails_helper'

RSpec.describe ScrapeExperiencias do

	let(:interactor) { ScrapeExperiencias.now }

	context 'with correct params' do

		it "Returns a Nokogiri object" do
			expect(interactor).to be_a Nokogiri::XML::NodeSet
		end

		it "Returns all Nokogiri objects" do
			expect(interactor).to all(be_a(Nokogiri::XML::Element))
		end

		context 'with correct params' do
			it "changes the amount of Entries" do
				expect { interactor }.to change { Entry.count }
			end
		end
	end

end