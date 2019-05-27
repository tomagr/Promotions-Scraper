if Rails.env.development?

	User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

	Subscriber.create!(name: 'Cobra', email: 'tomas@amalgama.co', available: true)

end