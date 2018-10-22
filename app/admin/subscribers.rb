ActiveAdmin.register Subscriber do
	permit_params :email, :available

	index do
		selectable_column
		id_column
		column :email
		column :created_at
		actions
	end

	filter :email
	filter :created_at

	form do |f|
		f.inputs do
			f.input :email
			f.input :available
		end
		f.actions
	end

end
