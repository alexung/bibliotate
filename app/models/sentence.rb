class Sentence < ActiveRecord::Base
  has_many :comments
  belongs_to :paragraph

  def commented?
    comment_count > 0
  end

  def comment_count 
  	self.comments.size
  end

  def story_sentence
    self.id - self.paragraph.story.sentences.first.id + 1
  end

end
