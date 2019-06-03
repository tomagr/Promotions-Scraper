RSpec.shared_context 'create user' do |role|
	let!( :user ) { create :user }
end

RSpec.shared_context 'create subscriber' do
	let!( :subscriber ) { create :subscriber }
end