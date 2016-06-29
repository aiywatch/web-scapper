class User

  def initialize(name)
    @name = name
  end

  def self.extract_usernames(doc)
    doc.search('.comhead  > a:first-child').map do |element|
      name = element.inner_text
      User.new(name)
    end
  end

end