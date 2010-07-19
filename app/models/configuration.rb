class Configuration < ActiveRecord::Base
  
  has_attached_file :image, 
    :path => ":rails_root/public/upload/:rails_env/configuration/:id/:style_:basename.:extension",
    :url => "/upload/:rails_env/configuration/:id/:style_:basename.:extension",
    :styles => { 
      :large => "600x600#", 
      :medium => "300x300#", 
      :thumb => "100x100#"
      }
  
end
