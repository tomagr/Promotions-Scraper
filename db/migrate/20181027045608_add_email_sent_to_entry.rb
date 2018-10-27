class AddEmailSentToEntry < ActiveRecord::Migration[5.1]
  def change
		add_column :entries, :email_sent, :boolean, default: false
  end
end
