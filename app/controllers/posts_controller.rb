class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :up_voted, :down_voted]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    params[:search] ? @posts = Post.search(params[:search]) : @posts ||= Post.all
    @communities ||= Community.popular_communities_mini
  end

  def show
     @commentable = @post
     @comments = @commentable.comments
  end

  def new
    @post = current_user.posts.new
  end

  def edit; end

  def create
    @post = current_user.posts.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @post.destroy
      redirect_to root_path, notice: 'POst was successfule destroyed'
    else
      redirect_to @post
    end
  end

  def up_voted
    current_user.likes(@post)
    redirect_back(fallback_location: root_path)
  end

  def down_voted
    @post.downvote_from current_user
    redirect_back(fallback_location: root_path)
  end


  private

    def set_post
      @post = Post.cache_find(params[:id])
      # @post ||= Post.friendly.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render file: 'public/404.html'
    end

    def post_params
      params.require(:post).permit(:title, :body, :image, :community_id)
    end
end
