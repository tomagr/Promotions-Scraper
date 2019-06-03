require 'rails_helper'
require 'contexts/for_models'

RSpec.shared_examples 'SendEmailToSubscribers is succesful' do
	it 'the creation is succesful and the owner was added as a member' do
		total_subscribers = Subscriber.count
		expect { @emails = send_emails }.to change { ActionMailer::Base.deliveries.count }.by(total_subscribers)
	end
end

RSpec.shared_examples 'SendEmailToSubscribers raise error' do |error|
	it { expect { send_emails }.to raise_exception error }
end

RSpec.describe SendEmailToSubscribers do

	include_context 'create entry'

	let!(:subscriber1) { create :subscriber }
	let!(:subscriber2) { create :subscriber }

	let(:send_emails) { SendEmailToSubscribers.for(entry: entry) }

	context 'with correct params' do
		include_examples 'SendEmailToSubscribers is succesful'
	end

end