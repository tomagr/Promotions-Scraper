class CreateSubscribers < ActiveRecord::Migration[5.1]
	def change
		create_table :subscribers do |t|
			t.string :email, index: true, unique: true
			t.boolean :available, null: false, defaul: true

			t.timestamps
		end
	end
end
