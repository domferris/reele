class AddViewCountToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :view_count, :integer, default: 0
  end
end
