class StoriesController < ApplicationController
  include StoryHelper
  def index
  end

  def show
    @story = Story.find(params[:id])
  end

  def new
    @courses = Course.where(user_id:current_user.id)
    @story = Story.new
  end

  def create
    if params[:story][:author] == ""
      params[:story][:author] = "Unknown"
    end
    if params[:course_id] == "" || params[:story][:title] == ""
      flash[:messages] = "Please be sure your story has a title and a course"
      redirect_to new_story_path
    end
    @story = Story.make(params[:story][:title],params[:story][:author],params[:story_body],params[:course_id])
    redirect_to @story
  end

  def destroy
    Story.destroy(params[:id])
    redirect_to '/'
  end

  def commentsfeed
    @story = Story.find(params[:id])
    render partial: 'comments_feed'
  end

end

