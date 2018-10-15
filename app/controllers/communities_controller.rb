class CommunitiesController < ApplicationController
  before_action :set_community, except: [:new, :create, :index]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @communities ||= Community.popular_communities
  end

  def new
    @community = Community.new
  end

  def create
    @community = Community.new(communities_params)
    if @community.save
      redirect_to root_path
      flash.now[:success] = 'Community created'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @community.update_attributes(communiries_params)
      flash.now[:success] = 'Updated information about community'
      redirect_to root_path
    else
      render :edit
      flash[:warning] = 'Opps we have a problems'
    end
  end

  def destroy
    if @community.destroy
      redirect_To root_path
      flash.now[:success] = 'Successeble delete'
    else
      redirect_to root_path
    end
  end

  def show; end

  private

  def communities_params
    params.require(:community).permit(:name, :image)
  end

  def set_community
    @community ||= Community.friendly.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render file: 'public/404.html'
  end
end
