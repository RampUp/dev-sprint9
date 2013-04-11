require 'nokogiri'
require 'open-uri'

class LolCatViewer

	def self.run(links=nil)
		loldocs = Nokogiri::HTML(open("http://www.lolcats.com/gallery/new.html"))
		iterable_cats = loldocs.css('.gallery-item img') 

		if (not links) or (links > iterable_cats.length)
			links = 1
		end

		$i = 0
		cat_array = []
		
		while $i < (iterable_cats.length) do 
			cat_array.push(iterable_cats[$i])
			$i += 1
		end

		cat_array.shuffle!

        $i = cat_array.length - links
        $fixed_length = cat_array.length
		while $i < $fixed_length do 
			cat = cat_array.pop
			puts "Title:#{cat['alt']} Link: http://www.lolcats.com#{cat['src']}"
            $i += 1
		end
	end
end

puts '---------------------------------'
puts 'Run with no argument.'
puts '---------------------------------'
LolCatViewer.run()
puts '---------------------------------'
puts 'Run with 5.'
puts '---------------------------------'
LolCatViewer.run(5)
puts '---------------------------------'
puts 'Run with an amount larger than images available.'
puts '---------------------------------'
LolCatViewer.run(5000)
