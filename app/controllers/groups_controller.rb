class GroupsController < ApplicationController
  before_action :set_group, only: [:update, :destroy]

  # GET /groups
  def index
    @groups = Group.all

    render json: @groups
  end

  # GET /groups/group_prefix
  def show
    authorize_request!(params[:user_id], params[:token])
    
    @group = Group.find_by(group_prefix: params[:id])
    current_user = User.find(params[:user_id])
    starred_channel_ids = current_user.starred_channel_ids_by_group(@group.id)
    starred_message_ids = current_user.starred_message_ids_by_group(@group.id)
    render json: @group, 
           user: current_user, 
           starred_channel_ids: starred_channel_ids,
           starred_message_ids: starred_message_ids
  end
  
  # GET /group_prefixes/group_prefix
  def right_prefix?
    group_there = Group.exists?(group_prefix: params[:group_prefix])
    render json: {exists: group_there}
  end

  # POST /groups
  def create
    @group = Group.new(group_params)

    if @group.save
      render json: @group, status: :created, location: @group
    else
      render json: @group.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /groups/1
  def update
    if @group.update(group_params)
      render json: @group
    else
      render json: @group.errors, status: :unprocessable_entity
    end
  end

  # DELETE /groups/1
  def destroy
    @group.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def group_params
      params.permit(:id, :user_id, :group_prefix)
    end
end
