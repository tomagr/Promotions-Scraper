class CreateLevels < ActiveRecord::Migration[5.2]
  def change
    create_table :levels do |t|
      t.string :clue
      t.string :code
      t.integer :priority

      t.timestamps
    end
  end
end
