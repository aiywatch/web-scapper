require 'nokogiri'


doc = Nokogiri::HTML(File.open('post.html'))

p doc

def extract_usernames(doc)
  doc.search('.comhead  > a:first-child').map do |element|
    element.inner_text
  end
end

doc.search('.subtext > span:first-child').map { |span| span.inner_text}
doc.search('.subtext > a:nth-child(3)').map {|link| link['href'] }
doc.search('.title > a:first-child').map { |link| link.inner_text}
doc.search('.title > a:first-child').map { |link| link['href']}
doc.search('.comment > font:first-child').map { |font| font.inner_text}


# File.open('noko.txt', 'w') { |file| file.write(doc)}