class AddPhotoToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :photo, :string
  end
end
