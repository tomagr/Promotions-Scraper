class CreateSiteScrapers < ActiveRecord::Migration[5.0]
  def change
    create_table :site_scrapers do |t|

      t.timestamps
    end
  end
end
