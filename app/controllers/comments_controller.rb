class CommentsController < ApplicationController
  before_action :load_commentable
  before_action :owner_comment, only: [:destroy]
  before_action :find_comment, only: [:destroy]
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
      redirect_to @commentable
    else
      redirect_to @commentable
    end
  end

  def destroy
    if @comment.destroy
      redirect_to @commentable
    else
      redirect_to @commentable, danger: "Opps we can't destroy comment"
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:body)
  end

  def load_commentable
    resource, id = request.path.split('/')[1, 2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end

  def find_comment
    @comment = @commentable.comments.find(params[:id])
  end

  def owner_comment
    find_comment
    unless @comment.user == current_user || current_user.admin? == true
      redirect_to @commentable
      flash.now[:danger] = "Sorry, you're not owners commet"
    end
  end
end
