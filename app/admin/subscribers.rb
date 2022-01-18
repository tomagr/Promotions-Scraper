ActiveAdmin.register Subscriber do
	permit_params :name, :email, :available,
								wishes_attributes: [:id, :name, :_destroy],
								filters_attributes: [:id, :name, :_destroy]

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
		column :name
		column :email
		actions
	end

	filter :name
	filter :email
	filter :created_at

	form do |f|
		f.semantic_errors
		f.object.errors.keys

		inputs do
			input :name
			input :email
			input :available, :as => :boolean, :input_html => { :checked => 'checked' }
		end

		inputs do
			f.has_many :wishes, allow_destroy: true, new_record: true do |a|
				a.input :name
			end
			f.has_many :filters, allow_destroy: true, new_record: true do |a|
				a.input :name
			end
		end

		actions

	end

	show do |subscriber|

		attributes_table_for subscriber do
			row :name
			row :email
			row :available
		end

		h3 'Wishes'
		subscriber.wishes.each do |filter|
			ul "#{filter.name} - '#{filter.response}'"
		end

		h3 'Filters'
		subscriber.filters.each do |filter|
			ul filter.name
		end

	end
end
