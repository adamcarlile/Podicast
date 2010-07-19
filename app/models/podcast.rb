class Podcast < ActiveRecord::Base
  
  has_attached_file :audio, 
    :path => ":rails_root/public/upload/:rails_env/podcast/:id/:basename.:extension",
    :url => "/public/upload/:rails_env/podcast/:id/:basename.:extension"
  
  def self.per_page
    20
  end
  
end
