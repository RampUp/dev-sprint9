require 'nokogiri'
require 'open-uri'

class LolcatViewer
	def self.run(n = 1)
		return_catz = Hash.new
		url = 'http://www.lolcats.com'
		links = []
		Nokogiri::HTML(open(url + "/gallery/new.html")).css('.gallery-item a').each do |link|
			links << link
		end
		n.times do
			arr_length = links.length
			rand_index = rand(arr_length -1)
			url_ext =  links[rand_index]['href']
			image_obj = Nokogiri::HTML(open(url + url_ext)).css('.picture-container>a>img')[0]
			title = image_obj['alt']
			img_url = url + image_obj['src']
			return_catz[title] = img_url
		end
		return_catz.each do |title, link|
			puts "title: " + title +" Link: " +  link
		end
	end
end
