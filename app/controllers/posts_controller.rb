class PostsController < ApplicationController
  before_action :authenticate_account!, expect: %i[index show]
  before_action :set_community, only: %i[show edit update destroy new create]
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = Post.all
  end

  def show; end

  def new; end

  def create
    @post = @community.posts.create(post_params)
    @post.update!(account: current_account)
    redirect_to community_path(@community)
  end

  private

  def set_community
    @community = Community.find(params[:community_id])
  end

  def set_post
    @post = @community.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
