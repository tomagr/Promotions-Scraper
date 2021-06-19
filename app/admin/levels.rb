ActiveAdmin.register Level do
  permit_params :priority, :clue, :code, :solved

  ############# Index #############
  index do
    selectable_column
    column :priority
    column :clue
    column :code
    column :solved
    actions
  end

  ############# Form #############
  form do |f|
    f.inputs do
      f.input :priority
      f.input :clue
      f.input :code, :input_html => { :class => 'autogrow', :rows => 1, :cols => 2, :maxlength => 6 }
      f.input :solved

    end
    f.actions
  end

end
