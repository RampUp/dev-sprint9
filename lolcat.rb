require 'nokogiri'
require 'open-uri'

class LolCatViewer

  def self.run(links=nil)
    loldocs = Nokogiri::HTML(open("http://www.lolcats.com/gallery/new.html"))
    iterable_cats = doc.css('.gallery-item img')

    if (not links) or (links < iterable_cats.length)
      links = 1
    end

    $i = 0
    cat_array = []

    while $i < iterable_cats.length do
      cat_link = Nokogiri::HTML(open("http://www.lolcats.com#{iterable_cats[$i]['href']}")).css(".picture-container img")[0]
      cat_array.push(cat_link)
      $i += 1
    end

    cat_indexor = (0..cat_array.length).to_a.shuffle
    
    $i = 0
    while $i < cat_indexor do
      cat = cat_indexor[$i].pop
      puts "Title:#{cat['alt']} Link: http://www.lolcats.com#{cat['src']}"
      $i += 1

    end
  end
end






