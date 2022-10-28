ActiveAdmin.register SubscriberWish do
	menu priority: 20

	permit_params :name, :claimed, :response

	#
	# Filters and Actions
	#
	index do
		selectable_column
		id_column
		column :name
		column :response
		column :claimed
		column :updated_at
		column :created_at
		actions
	end

	filter :name
	filter :response
	filter :created_at


end
