class CreateAppConfigs < ActiveRecord::Migration[5.2]
  def change
    create_table :app_configs do |t|
      t.string :slug, null: false
      t.text :value

      t.timestamps
    end
  end
end
