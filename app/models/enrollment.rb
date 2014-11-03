class Enrollment < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  has_many :notifications, as: :noteable, dependent: :destroy

end
