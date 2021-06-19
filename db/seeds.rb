if Rails.env.development?

  User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
  User.create!(email: 'tomas@amalgama.co', password: 'sinclair', password_confirmation: 'sinclair')

  Subscriber.create!(name: 'Cobra', email: 'tomas@amalgama.co', available: true)

  Level.create!(clue: 'Martes 22/06 14.00 - San Martin de los Andes 4444 PB 2. Nombre del cocinero', priority: 1, code: 'agrimb')
end
