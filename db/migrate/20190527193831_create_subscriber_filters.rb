class CreateSubscriberFilters < ActiveRecord::Migration[5.2]
	def change
		create_table :subscriber_filters do |t|
			t.references :subscriber, index: true, null: false
			t.string :name, null: false

			t.timestamps
		end
	end
end
