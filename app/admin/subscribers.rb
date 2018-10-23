ActiveAdmin.register Subscriber do
	permit_params :email, :available

	#
	# Filters and Actions
	#
	batch_action 'Marcar como Inactivos' do |selection|
		Subscriber.find(selection).each { |s| s.update_attributes(:available => false) }
		redirect_to collection_path, :alert => 'Marcados como Inactivos'
	end

	batch_action 'Marcar como Activos' do |selection|
		Subscriber.find(selection).each { |s| s.update_attributes(:available => true) }
		redirect_to collection_path, :alert => 'Marcados como Activos'
	end

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
