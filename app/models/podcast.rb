class Podcast < ActiveRecord::Base
    
  has_attached_file :audio, 
    :path => ":rails_root/public/upload/:rails_env/podcast/:id/:filename",
    :url => "/upload/:rails_env/podcast/:id/:filename"
  
  before_post_process :transliterate_file_name
  
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
  
  
  def transliterate_file_name
    extension = File.extname(local_file_name).gsub(/^\.+/, '')
    filename = local_file_name.gsub(/\.#{extension}$/, '')
    self.local.instance_write(:file_name, "#{transliterate(filename)}.#{transliterate(extension)}")
  end
  
  def transliterate(str)
    # Based on permalink_fu by Rick Olsen
    # Escape str by transliterating to UTF-8 with Iconv
    s = Iconv.iconv('ascii//ignore//translit', 'utf-8', str).to_s
    # Downcase string
    s.downcase!
    # Remove apostrophes so isn't changes to isnt
    s.gsub!(/'/, '')
    # Replace any non-letter or non-number character with a space
    s.gsub!(/[^A-Za-z0-9]+/, ' ')
    # Remove spaces from beginning and end of string
    s.strip!
    # Replace groups of spaces with single hyphen
    s.gsub!(/\ +/, '-')
    return s
  end
    
end
