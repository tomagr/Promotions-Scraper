class CreateSubscriberWishes < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriber_wishes do |t|
      t.references :subscriber, index: true, null: false
      t.string :name, null: false
      t.text :response

      t.timestamps
    end
  end
end
