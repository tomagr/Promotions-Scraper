class AddAvailableToEntry < ActiveRecord::Migration[6.1]
  def change
    add_column :entries, :available, :boolean, default: false
  end
end
