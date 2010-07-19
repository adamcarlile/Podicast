xml.instruct! :xml, :version=>"1.0" 
xml.tag!("rss", "version".to_sym => "2.0", "xmlns:itunes".to_sym => "http://www.itunes.com/dtds/podcast-1.0.dtd"){
  xml.channel{
    xml.title("Hollands Pies - PieCast")
    xml.link('/')
    xml.description("Holland's Pies new regular bi-monthly podcast show, hosted by and featuring our own employees, will give you listeners a real chance to find out what goes on behind the scenes at our factory in Baxenden, Lancashire.")
    xml.pubDate(@podcasts.first.created_at.strftime("%a, %d %b %Y 04:00:00 GMT"))
    xml.language('en-gb')
    xml.tag!("itunes:summary", "Holland's Pies new regular bi-monthly podcast show, hosted by and featuring our own employees, will give you listeners a real chance to find out what goes on behind the scenes at our factory in Baxenden, Lancashire.")
    xml.tag!("itunes:explicit", "No")
    xml.tag!("itunes:category", :text => "Games &amp; Hobbies ") do
      xml.tag!("itunes:category", :text => "Automotive")
    end
    xml.tag!("itunes:author", "Alex Goy")
    xml.tag!("itunes:owner") do
      xml.tag!("itunes:name", "Alex Goy")
      xml.tag!("itunes:email", "piecast@hollandspies.co.uk")
    end
    xml.tag!("itunes:image", :href => "http://skin/piecast/cover_piecast.jpg")  
      for @podcast in @podcasts
        xml.item do
          xml.title(@podcast.title)
          xml.description(@podcast.summary)      
          xml.author("piecast@hollandspies.co.uk (Hollands Pies)")               
          xml.pubDate(@podcast.created_at.strftime("%a, %d %b %Y 04:00:00 GMT"))
          xml.link(podcast_url(@podcast))
          xml.enclosure(:url => "http://localhost:3000#{@podcast.audio.url}", 
            :length => @podcast.audio_file_size, :type => @podcast.audio_content_type)
          xml.guid('test')
          xml.tag!("itunes:author", "piecast@hollandspies.co.uk (Hollands Pies)")
          xml.tag!("itunes:subtitle", @podcast.description)
          xml.tag!("itunes:summary", @podcast.summary)
          xml.tag!("itunes:duration", @podcast.duration)
          xml.tag!("itunes:image", :href => "http://skin/piecast/cover_piecast.jpg")
          xml.tag!("itunes:keywords", "hollands pies, piecast, pies")
        end
      end
  }
}