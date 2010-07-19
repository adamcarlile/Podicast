class AddKeywordsToPodcast < ActiveRecord::Migration
  def self.up
    add_column :podcasts, :keywords, :string
  end

  def self.down
    remove_column :podcasts, :keywords
  end
end
