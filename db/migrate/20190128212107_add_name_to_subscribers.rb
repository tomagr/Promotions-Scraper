class AddNameToSubscribers < ActiveRecord::Migration[5.1]
  def change
    add_column :subscribers, :name, :string, null: false
  end
end
