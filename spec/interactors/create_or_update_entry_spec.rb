require 'rails_helper'

RSpec.describe CreateOrUpdateEntry do

	let(:title) { "A title to rat" }
	let(:status) { "coming" }
	let(:site_id) { 20896 }
	let(:available) { false }

	let(:interactor) { CreateOrUpdateEntry.by(title: title, status: status, site_id: site_id, available: available) }

	context 'with correct params' do

		context 'when creating a new entry' do
			it { expect { interactor }.to change { Entry.count } }
			it { expect(interactor).to be_a Entry }
		end

		context 'when updating an entry' do
			let!(:entry) { create :entry, site_id: site_id }
			it { expect { interactor }.not_to change { Entry.count } }
			it { expect(interactor).to eq entry }
		end
	end

	context 'with incorrect params' do

		context 'without a nil title' do
			let(:title) { nil }
			include_examples 'interactor raises an error', Error
		end

		context 'without a title' do
			let(:title) { '' }
			include_examples 'interactor raises an error', Error
		end

		context 'without a nil status' do
			let(:status) { nil }
			include_examples 'interactor raises an error', Error
		end

		context 'without a status' do
			let(:status) { '' }
			include_examples 'interactor raises an error', Error
		end

		context 'without a nil site_id' do
			let(:site_id) { nil }
			include_examples 'interactor raises an error', Error
		end

		context 'without a site_id' do
			let(:site_id) { '' }
			include_examples 'interactor raises an error', Error
		end

	end

end