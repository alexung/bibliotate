require 'yaml'
# require 'rails_helper'
# include StoryCreatorHelper
# require_relative '../config/environment'
# require File.expand_path('../../app/helpers/story_creator_helper.rb',__FILE__)
# include StoryCreator

path = 'db/seed_data.yaml'
seed_data = YAML.load File.read path

users = seed_data[:users]
enrollments = seed_data[:enrollments]
stories = seed_data[:stories]
comments = seed_data[:comments]
courses = seed_data[:courses]
notifications = seed_data[:notifications]

users.each do |attrs|
  User.new(attrs).save(:validate => false)
end

enrollments.each do |attrs|
  Enrollment.new(attrs).save(:validate => false)
end

comments.each do |attrs|
  Comment.new(attrs).save(:validate => false)
end

courses.each do |attrs|
  Course.new(attrs).save(:validate => false)
end
notifications.each do |attrs|
  Notification.new(attrs).save(:validate => false)
end

Story.make(stories[0][:title], stories[0][:author], stories[0][:body], stories[0][:course_id])
Story.make(stories[0][:title], stories[0][:author], stories[0][:body], 2)
Story.make(stories[1][:title], stories[1][:author], stories[1][:body], stories[1][:course_id])
Story.make(stories[1][:title], stories[1][:author], stories[1][:body], 3)
Story.make(stories[2][:title], stories[2][:author], stories[2][:body], stories[2][:course_id])
Story.make(stories[2][:title], stories[2][:author], stories[2][:body], 4)
Story.make(stories[3][:title], stories[3][:author], stories[3][:body], stories[3][:course_id])
Story.make(stories[3][:title], stories[3][:author], stories[3][:body], 1)
Story.make(stories[4][:title], stories[4][:author], stories[4][:body], stories[4][:course_id])
Story.make(stories[4][:title], stories[4][:author], stories[4][:body], 2)





