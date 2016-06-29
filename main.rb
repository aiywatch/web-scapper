require 'open-uri'
require 'nokogiri'
require_relative 'post'
require_relative 'comment'
require_relative 'user'

def get_input_to_doc
  raise ArgumentError, "No URL Error" if ARGV[0].nil?
  begin
    html_file = open(ARGV[0])
  rescue
    puts "Invalid URL"
    exit
  end
  # puts html_file.read
  doc = Nokogiri::HTML(open(html_file))
end

def create_post(doc)
  title = Post.extract_title(doc)

  users = User.extract_usernames(doc)
  post_user = users[0]

  url = ARGV[0]
  post = Post.new(title, post_user, url)

  comments = Comment.create_comments(doc, users)
  post.add_comment(comments)

  post
end

doc = get_input_to_doc
post = create_post(doc)


post.display





# def extract_title(doc)
#   doc.search('title').map do |element|
#     element.inner_text
#   end
# end

# def extract_comments(doc)
#   doc.search('.comment > span:first-child').map { |span| span.inner_text.strip}
# end

# def extract_usernames(doc)
#   doc.search('.comhead  > a:first-child').map do |element|
#     element.inner_text
#   end
# end

# def create_comments(comments, users)
#   array_comment = []
#   comments.each_with_index do |comment, i|
#     array_comment << Comment.new(users[i+1], comment)
#   end
#   array_comment
# end
