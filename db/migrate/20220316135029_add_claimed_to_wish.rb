class AddClaimedToWish < ActiveRecord::Migration[5.2]
  def change
    add_column :subscriber_wishes, :claimed, :boolean, default: false
  end
end
