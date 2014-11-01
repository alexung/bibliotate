class Story < ActiveRecord::Base
  has_many :paragraphs
  has_many :sentences, through: :paragraphs
  has_many :comments, through: :sentences
  validates :title, presence: true
  validates :course_id, presence: true
  belongs_to :course

  def self.make(title, author, body, course_id)
  # Create story in database
    story = Story.create(title: title, author: author, course_id: course_id)
  # Paragraphs is an array of paragraphs generated by splitting the body at new lines
    paragraphs = body.split("\n")
  # Removing blank space
    paragraphs.reject! {|line| line.empty?}
  # Make paragraphs
    self.paragraph_maker(paragraphs, story.id)
    story
  end

  private
  PARSER = TactfulTokenizer::Model.new
  def self.paragraph_maker(paragraphs, story_id)
    paragraphs.each do |paragraph|
      paragraph_object = Paragraph.create(story_id: story_id)
      sentences = self.parse_to_sentences(paragraph)
      self.sentence_maker(sentences, paragraph_object.id)
    end
  end

  def self.parse_to_sentences(paragraph)
    PARSER.tokenize_text(paragraph)
  end

  def self.sentence_maker(sentences, paragraph_id)
    sentences.each do |sentence|
      Sentence.create!(body: sentence, paragraph_id: paragraph_id)
    end
  end
end
