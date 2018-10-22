ActiveAdmin.register Subscriber do
	permit_params :email, :available

	scope(:available, default: true) do |subscriber|
		subscriber.where(:available => true)
	end

	scope(:unavailable, default: true) do |subscriber|
		subscriber.where(:available => false)
	end

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
			f.input :available, :as => :boolean, :input_html => { :checked => 'checked' }
		end
		f.actions
	end

end
