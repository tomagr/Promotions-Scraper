ActiveAdmin.register AppConfig do
	menu priority: 50

	permit_params :slug, :value
	
	index do
		selectable_column
		id_column
		column :slug
		column :value
		actions
	end

	filter :slug
	filter :value
	filter :created_at

	form do |f|
		f.semantic_errors
		f.object.errors.keys

		inputs do
			input :slug
			input :value
		end
		
		actions

	end

	show do |app_config|

		attributes_table_for app_config do
			row :slug
			row :value
			row :created_at
		end

	end
end
