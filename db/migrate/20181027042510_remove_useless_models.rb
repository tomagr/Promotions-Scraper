class RemoveUselessModels < ActiveRecord::Migration[5.1]
	def change
		drop_table :scrapers if table_exists? :scrapers
		drop_table :site_scrapers if table_exists? :site_scrapers
	end
end

