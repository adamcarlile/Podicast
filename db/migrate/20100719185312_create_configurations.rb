class CreateConfigurations < ActiveRecord::Migration
  def self.up
    create_table :configurations do |t|
      t.column :name, :string
      t.column :description, :text
      t.column :summary, :text
      t.column :explicit, :boolean
      t.column :category, :string
      t.column :sub_category, :string
      t.column :author, :string
      t.column :email, :string
      t.column :image_file_name, :string
      t.column :image_content_type, :string
      t.column :image_file_size, :integer
      t.column :image_updated_at, :datetime
      t.timestamps
    end
  end

  def self.down
    drop_table :configurations
  end
end
