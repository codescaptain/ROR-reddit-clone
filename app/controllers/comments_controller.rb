class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.account_id = current_account.id
    if @comment.save
      respond_to do |format|
        format.html { redirect_to community_post_path(@comment.post.community_id, @comment.post_id), notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:message, :post_id)
  end
end
