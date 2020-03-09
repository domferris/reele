class AddAudioUrlToProject < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :audio_url, :string
  end
end
