require 'colorize'
# require_relative 'comment'

class Post
  @@last_id = 0
  attr_reader :comments

  def initialize(title, user, url)
    raise StandardError, "No title" if title.nil? or title.empty?
    @title = title
    @user = user
    @url = url
    @points = 0
    @item_id = gen_item_id
    @comments = []
  end

  def add_comment(comment)
    @comments.concat(comment)
  end

  def gen_item_id
    @@last_id += 1
  end

  def to_s
    str = "The title is : #{@title} \n "
    str << "comments :::: \n"
    @comments.each{ |x| str << "#{x} \n" }
    str
  end

  def display
    puts "Post titile: #{@title}".white.on_blue
    puts "number of comments: #{@comments.size}".red
    print "Posted by : "
    puts "#{@user}".green

    @comments.each do |comment|
      puts "Posted by #{comment.user}".magenta
      puts comment.text
    end
  end

  def self.extract_title(doc)
    doc.search('title').map do |element|
      element.inner_text
    end
  end


end