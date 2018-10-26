class AddReleasedDateToEntry < ActiveRecord::Migration[5.1]
  def change
    add_column :entries, :released_at, :datetime, null: true
  end
end
