ActiveAdmin.register Entry do
	permit_params :title, :status, :date, :site_id

	index do
		selectable_column
		column :title
		column :status
		column :site_id
		column :created_at
		actions
	end

	filter :title
	filter :status
	filter :created_at

	form do |f|
		f.inputs do
			f.input :title
			f.input :status
			f.input :date
			f.input :site_id
		end
		f.actions
	end

	show do |entity|

		attributes_table_for entity do
			row :title
			row :status
			row :date
			row :site_id
			row :created_at
		end

	end

end
