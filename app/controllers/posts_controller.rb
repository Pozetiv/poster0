class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :up_voted, :down_voted]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_owner || :admin, only: [:edit, :update, :destroy]

  def index
    params[:search] ? @posts = Post.search(params[:search][:search_text]).paginate(:page => params[:page]) : @posts = Post.paginate(:page => params[:page])
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
        format.html { redirect_to @post, info: 'Post was successfully created.' }
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
        format.html { redirect_to @post, info: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @post.destroy
      redirect_to root_path, info: 'Post was successfule destroyed'
    else
      redirect_to @post
    end
  end

  def up_voted
    @post.upvote_from(current_user)
    redirect_back(fallback_location: root_path)
  end

  def down_voted
    @post.downvote_from(current_user)
    redirect_back(fallback_location: root_path)
  end


  private

    def set_post
      @post ||= Post.friendly.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :body, :image, :community_id)
    end

    def check_owner
      unless @post.user == current_user || @post.community.administrator?(current_user.id)
        redirect_to @post, Info: "Sorry you are cann't do this"
      end
    end
end
