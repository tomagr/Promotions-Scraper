ActiveAdmin.register Entry do
  permit_params :title, :status, :featured

  ############# Scopes #############
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

  ############# Actions #############
  action_item :view, only: :index do
    link_to 'Scrape', scrape_path
  end

  action_item :view, only: :index do
    link_to 'Test email', send_test_email_admin_entries_path
  end

  collection_action :send_test_email do
    UserMailer.new_entry_email(entry: Entry.last, subscriber: current_user).deliver_now
    redirect_to admin_root_path
  end

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
