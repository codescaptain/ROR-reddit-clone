class CommunitiesController < ApplicationController
    before_action :authenticate_account!, expect: [ :index, :show ] 
    before_action :set_community, only: %i[show edit update destroy]

    def index
    @communities = Community.all
    end

    def show
    @posts = @community.posts.all
    end

    def new
    @community = Community.new
    end

    def create
        @community = current_account.communities.new(community_params)
        if @community.save
            redirect_to communities_path
        else
            render :new
        end
    end

    private

    def set_community
        @community = Community.find(params[:id])
    end

    def community_params
        params.require( :community ).permit(:name, :url, :rules)
    end
end
