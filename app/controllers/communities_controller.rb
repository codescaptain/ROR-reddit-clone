class CommunitiesController < ApplicationController
    before_action :authenticate_account!, expect: [ :index, :show ] 
    before_action :set_community, only: %i[show edit update destroy]

    def index
        @communities = Community.all
    end

    def show
        @posts = @community.posts.all
        @subscriber_count = @community.subscribers.count
        @is_subscribed = account_signed_in? ? Subscription.where(community_id: @community.id, account_id: current_account.id).any? : false
        @subscription = Subscription.new
    end

    def new
        @community = Community.new
    end

    def create
        @community = current_account.communities.create(community_params)
        @community.update!(account: current_account)
        redirect_to communities_path
    end

    private

    def set_community
        @community = Community.find(params[:id])
    end

    def community_params
        params.require( :community ).permit(:name, :url, :summary, :rules)
    end
end
