class CommentsController < ApplicationController
  before_action :find_commentable
  before_action :owner_comment, only: [:destroy]
  before_action :find_comment, only: [:destroy, :update, :edit]
  before_action :authenticate_user!, expect: [:index]

  def index
    @comments = @commentable.comments
  end

  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.new(comments_params)
    @comment.user = current_user
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def edit; end

  def update
    if @comment.update_attributes(comments_params)
      redirect_back(fallback_location: root_path )
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    if @comment.destroy
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:body)
  end

  def find_commentable
    @commentable = Comment.find(params[:comment_id]) if params[:comment_id]
    @commentable = Post.find(params[:post_id]) if params[:post_id]
  end

  def find_comment
    @comment = @commentable.comments.find(params[:id])
  end

  def owner_comment
    find_comment
    unless @comment.user == current_user || current_user.admin? == true
      redirect_to @commentable, danger: "Sorry, you're not owners commet"
    end
  end
end
