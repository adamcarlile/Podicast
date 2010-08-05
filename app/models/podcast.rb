class Podcast < ActiveRecord::Base
    
  default_scope :order => :created_at
    
  has_attached_file :audio, 
    :path => ":rails_root/public/upload/:rails_env/podcast/:id/:filename",
    :url => "/upload/:rails_env/podcast/:id/:filename"
    
  def self.per_page
    20
  end
  
  def explicit?
    if explicit
      "Yes"
    else
      "No"
    end
  end
    
end
