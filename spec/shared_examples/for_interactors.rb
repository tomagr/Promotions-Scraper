RSpec.shared_examples 'interactor raises an error' do |error|
	it {
		expect { interactor }.to raise_exception error
	}
end