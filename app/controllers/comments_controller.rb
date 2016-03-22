class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @place = Place.find(params[:place_id])
    @place.comments.create(comment_params.merge(user: current_user))
    redirect_to place_path(@place)
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to user_path(current_user)
    else
      return flash[:alert]  = 'Error whilst deleting comment'
      redirect_to user_path(current_user)
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:message, :rating)
    end

end
