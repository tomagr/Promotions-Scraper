ActiveAdmin.register Level do
  permit_params :title, :status, :featured, :email_sent

  ############# Index #############
  index do
    selectable_column
    column :title do |entity|
      title = entity.title
      title += entity.featured? ? ' (*)' : ''
      title
    end
    column :status
    column :created_at
    column :updated_at
    column :released_at
    column :email_sent
    actions
  end

  filter :title
  filter :updated_at
  filter :created_at

  ############# Form #############
  form do |f|
    f.inputs do
      f.input :title
      f.input :status
      f.input :featured
      f.input :email_sent
    end
    f.actions
  end

  ############# Show #############
  show do |entity|

    attributes_table_for entity do
      row :title
      row :status
      row :status
      row :email_sent
      row :site_link do
        link_to entity.site_link, entity.site_link
      end
      row :created_at
      row :updated_at
      row :released_at
      row :featured
    end

  end

end
