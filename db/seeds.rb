if Rails.env.development?

  unless User.exists?(email: 'admin@example.com')
    User.create!(
			email: 'admin@example.com',
			password: 'password',
			password_confirmation: 'password'
		)
	end

  unless User.exists?(email: 'tomas@amalgama.co')
    User.create!(
			email: 'tomas@amalgama.co',
			password: 'password',
			password_confirmation: 'password'
		)
	end

  unless Subscriber.exists?(email: 'tomas@amalgama.co')
    Subscriber.create!(
			name: 'Cobra',
			email: 'tomas@amalgama.co',
			available: true)
	end

end
