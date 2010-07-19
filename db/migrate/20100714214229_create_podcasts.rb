class CreatePodcasts < ActiveRecord::Migration
  def self.up
    create_table :podcasts do |t|
      t.column :title, :string
      t.column :description, :text
      
      t.column :audio_file_name,    :string
      t.column :audio_content_type, :string
      t.column :audio_file_size,    :integer
      t.column :audio_updated_at,   :datetime
      t.timestamps
    end
  end

  def self.down
    drop_table :podcasts
  end
end
