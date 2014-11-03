class CommentsController < ApplicationController

  def create
    comment = Comment.new(comment_params)
    comment.user = current_user
    comment.save
    Notification.create(noteable_id: comment.id, noteable_type: "comment", user_id: Sentence.find(params[:sentence_id]).paragraph.story.course.user_id)
    @comments = Comment.where(sentence_id: comment_params[:sentence_id])
    @sentence_id = params[:sentence_id]
    render partial: 'comment_display'
  end

  def show
    @sentence_id = params[:id]
    @comments = Comment.where(sentence_id: @sentence_id)
    render partial: 'comment_display'
  end

  private

  def comment_params
    params.permit(:body, :sentence_id, :user_id)
  end

end





