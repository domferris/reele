class CreateChatrooms < ActiveRecord::Migration[6.0]
  def change
    create_table :chatrooms do |t|
      t.string :name
      t.references :sender, index: true, foreign_key: { to_table: :users}
      t.references :receiver, index: true, foreign_key: { to_table: :users}

      t.timestamps
    end
  end
end
