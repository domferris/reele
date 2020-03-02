class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :media_type
      t.boolean :published, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
