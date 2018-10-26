ActiveAdmin.register Entry do
	permit_params :title, :status, :date, :site_id

	scope('today', default: true) do |entity|
		entity.available
	end

	scope('Próximos', default: true) do |entity|
		entity.where(:status => 'coming')
	end

	scope('Esta semana', default: true) do |entity|
		entity.where(:status => 'this_week')
	end

	scope('Agotados', default: true) do |entity|
		entity.where(:status => 'outofstock')
	end

	index do
		selectable_column
		column :title
		column :status
		column :created_at
		column :updated_at
		column :released_at
		actions
	end

	filter :title
	filter :updated_at
	filter :created_at

	form do |f|
		f.inputs do
			f.input :title
			f.input :status
		end
		f.actions
	end

	show do |entity|

		attributes_table_for entity do
			row :title
			row :status
			row :site_link do
				link_to entity.site_link, entity.site_link
			end
			row :created_at
		end

	end

end
