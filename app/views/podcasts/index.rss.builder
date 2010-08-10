xml.instruct! :xml, :version=>"1.0" 
xml.tag!("rss", "version".to_sym => "2.0", "xmlns:itunes".to_sym => "http://www.itunes.com/dtds/podcast-1.0.dtd"){
  xml.channel{
    xml.title(@config.name)
    xml.link('http://podcast.alexgoy.com')
    xml.description(@config.description)
    xml.pubDate(@podcasts.first.created_at.strftime("%a, %d %b %Y 04:00:00 GMT"))
    xml.language('en-gb')
    xml.tag!("itunes:summary", @config.summary)
    xml.tag!("itunes:explicit", @config.explicit?)
    xml.tag!("itunes:category", :text => @config.category) do
      xml.tag!("itunes:category", :text => @config.sub_category)
    end
    xml.tag!("itunes:author", @config.author)
    xml.tag!("itunes:owner") do
      xml.tag!("itunes:name", @config.author)
      xml.tag!("itunes:email", @config.email)
    end
    xml.tag!("itunes:image", :href => "http://podcast.alexgoy.com#{@config.image.url(:large)}")  
      for @podcast in @all_podcasts
        xml.item do
          xml.title(@podcast.title)
          xml.description(@podcast.summary)      
          xml.author(@config.email)               
          xml.pubDate(@podcast.created_at.strftime("%a, %d %b %Y 04:00:00 GMT"))
          xml.link(podcast_url(@podcast))
          xml.enclosure(:url => "http://podcast.alexgoy.com#{@podcast.audio.url}", 
            :length => @podcast.audio_file_size, :type => @podcast.audio_content_type)
          xml.guid(@podcast.id + @podcast.audio.url)
          xml.tag!("itunes:author", "#{@config.email} (#{@config.author})")
          xml.tag!("itunes:subtitle", @podcast.description)
          xml.tag!("itunes:summary", @podcast.summary)
          xml.tag!("itunes:duration", @podcast.duration)
          xml.tag!("itunes:image", :href => "http://podcast.alexgoy.com#{@config.image.url(:large)}")
          xml.tag!("itunes:keywords", @podcast.keywords)
        end
      end
  }
}