class AddAvailabilityToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :available, :boolean
  end
end
