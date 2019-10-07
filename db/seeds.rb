if Rails.env.development?

	User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
	User.create!(email: 'tomas@amalgama.co', password: 'sinclair', password_confirmation: 'sinclair')

	Subscriber.create!(name: 'Cobra', email: 'tomas@amalgama.co', available: true)

end
