ActiveAdmin.register Entry do
	permit_params :title, :status, :date, :site_id

	scope('Disponibles', default: true) do |subscriber|
		subscriber.where('status != "Próximamente"').where('status != "Agotado"')
	end

	scope('Próximamente', default: true) do |subscriber|
		subscriber.where(:status => 'Próximamente')
	end

	scope('Agotados', default: true) do |subscriber|
		subscriber.where(:status => 'Agotado')
	end

	index do
		selectable_column
		column :title
		column :status
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
			row :site_link do
				link_to entity.site_link, entity.site_link
			end
			row :created_at
		end

	end

end
