class RemoveDateFromEntry < ActiveRecord::Migration[5.1]
	def change
		remove_column :entries, :date
	end
end
