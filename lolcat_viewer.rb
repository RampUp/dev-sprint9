require 'nokogiri'
require 'open-uri'

class LolcatViewer
  def self.run(count=1)
    doc = Nokogiri::HTML(open("http://www.lolcats.com/gallery/new.html"))
    links = doc.css('.gallery-item img').map do |link|
      full_image = Nokogiri::HTML(open("http://www.lolcats.com#{link['href']}")).css(".picture-container img")[0]
      {:title => full_image['alt'], :link => "http://www.lolcats.com#{full_image['src']}"}
    end
    link_results = []
    count.times do
      random_link = links[rand(links.length - 1)]
      link_results << links.delete(random_link)
    end
    link_results.each do |link|
      puts "Title:#{link[:title]} Link:#{link[:link]}"
    end
    nil
  end
end

LolcatViewer.run(2)