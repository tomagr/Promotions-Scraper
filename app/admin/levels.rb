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
      f.input :text
      f.input :code
      f.input :solved
    end
    f.actions
  end

end
