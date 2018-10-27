class RemoveUselessModels < ActiveRecord::Migration[5.1]
  def change
		drop_table :scrapers
		drop_table :site_scrapers
  end
end
