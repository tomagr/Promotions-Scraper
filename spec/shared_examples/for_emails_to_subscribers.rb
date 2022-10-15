RSpec.shared_examples 'SendEmailToSubscribers is succesful' do
	it 'all the emails are sent to the subscribers' do
		total_subscribers = Subscriber.count
		expect { @emails = send_emails }.to change { ActionMailer::Base.deliveries.count }.by(total_subscribers)
	end
end

RSpec.shared_examples 'SendEmailToSubscribers is succesful but filtered' do
	it 'emails are not sent to the subscribers with matching filters' do
		expect { @emails = send_emails }.to change { ActionMailer::Base.deliveries.count }.by(1)
	end
end