class MakeSubscribersAvailableDefault < ActiveRecord::Migration[5.2]
  def change
		change_column :subscribers, :available, :boolean, :default => true
  end
end
