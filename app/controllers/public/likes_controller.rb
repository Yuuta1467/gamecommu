class Public::LikesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @post_comment = PostComment.find(params[:post_comment_id])
    @like = Like.create(user_id: current_user.id, post_id: @post.id, post_comment_id: @post_comment.id)
    redirect_to post_path(@post_comment.post)
  end


  def destroy
    @post = Post.find(params[:post_id])
    @post_comment = PostComment.find(params[:post_comment_id])
    Like.find_by(user_id: current_user.id, post_id: @post.id, post_comment_id: @post_comment.id).destroy
    redirect_to post_path(@post_comment.post)
  end
end
