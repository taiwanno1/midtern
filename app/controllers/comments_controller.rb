class CommentsController < ApplicationController

  before_action :find_event

  def index
    @comments = @event.comments
    @comment = @event.comments.new
    @comments = @comments.page(params[:page]).per(10)

  end

  def create
    @comment = @event.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to event_comments_path(:page => params[:page])
    else
      redirect_to event_comments_path
    end
  end

  def destroy
    @comment = @event.comments.find(params[:id])
    @comment.destroy
    redirect_to event_comments_path
  end



private

  def find_event
    @event = Event.find(params[:event_id])
  end

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
