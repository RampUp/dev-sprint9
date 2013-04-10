require 'nokogiri'
require 'open-uri'

class NewOnionArticles
	def self.run()
		return_news = Hash.new
		url = 'http://www.theonion.com'
		Nokogiri::HTML(open(url)).css('section.recent-news a').each do |link|
			title = link.content
			link_url = link['href']
			return_news[title] = url + link_url
		end
		return_news.each do |title, address|
			puts 'Title: ' + title + ' Link: ' + address
		end
	end
end

NewOnionArticles.run()