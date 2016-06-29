class Comment
  attr_reader :user, :text
  def initialize(user, text)
    @user = user
    @text = text
  end


  def self.create_comments(doc, users)
    comments = self.extract_comments(doc)
    self.comment_users(comments, users)
  end

  def self.extract_comments(doc)
    doc.search('.comment > span:first-child').map { |span| span.inner_text.strip}
  end

  def self.comment_users(comments, users)
    array_comment = []
    comments.each_with_index do |comment, i|
      array_comment << Comment.new(users[i+1], comment)
    end
    array_comment
  end


end