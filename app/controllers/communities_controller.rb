class CommunitiesController < ApplicationController
  before_action :set_community, except: [:new, :create, :index]
  before_action :authenticate_user!, except: [:index, :show, :list_users]
  before_action :owner || :admin, except: [:index, :show, :list_users, :new, :create]

  def index
    @communities ||= Community.popular_communities
  end

  def new
    @community = Community.new
  end

  def create
    @community = current_user.created_communities.new(communities_params)
    if @community.save
      redirect_to @community
      flash.now[:success] = 'Community created'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @community.update_attributes(communities_params)
      flash.now[:success] = 'Updated information about community'
      redirect_to @community
    else
      render :edit
      flash[:warning] = 'Opps we have a problems'
    end
  end

  def destroy
    if @community.destroy
      redirect_to root_path
      flash.now[:success] = 'Successeble delete'
    else
      redirect_to root_path
    end
  end

  def show
    @rules = @community.rules
    @admins = @community.community_administrations
  end

  def list_users
    @users = @community.users
  end

  def admin
    @community.add_administrations(params[:user].to_i)
    redirect_back(fallback_location: subscribers_path)
  end

  private

  def communities_params
    params.require(:community).permit(:name, :image, :category, rules_attributes: [:id, :text, :title, :_destroy])
  end

  def set_community
    @community ||= Community.friendly.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render file: 'public/404.html'
  end

  def owner
    unless @community.owner?(current_user)
      redirect_to @community, info: "You adre not owner #{@community.name} community"
    end
  end
end
