class AddFeaturedToEntries < ActiveRecord::Migration[5.1]
  def change
		add_column :entries, :featured, :boolean, default: false
  end
end
