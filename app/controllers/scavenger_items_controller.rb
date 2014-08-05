class ScavengerItemsController < ApplicationController
  before_action :find_challenge, only: [:new, :edit, :create, :update, :destroy]
  before_action :find_action_scavenger, except: [:index, :show]
  before_action :find_scavenger_item, only: [:update, :destroy, :edit]

  def new
    @scavenger_item = ScavengerItem.new
  end

  def edit
  end

  def update
    if @scavenger_item.update(scavenger_items_params)
      redirect_to challenge_action_stub_path(@challenge, @action_scavenger.action_stub), notice: 'Item was successfully updated.'
    else
      render :edit
    end
  end

  def create
    @scavenger_item = ScavengerItem.new(scavenger_items_params.merge(action_scavenger_id: @action_scavenger.id))

    if @scavenger_item.save
      redirect_to challenge_action_stub_path(@challenge, @action_scavenger.action_stub), notice: 'Item was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @scavenger_item.destroy
    flash[:notice] = 'Item was successfully deleted'
    redirect_to challenge_action_stub_path(@challenge, @action_scavenger.action_stub)
  end

  private

  def scavenger_items_params
    params.require(:scavenger_item).permit(:hint_msg, :found_msg, :order, :find_amt)
  end

  def find_scavenger_item
    @scavenger_item = ScavengerItem.find(params[:id])
  end

  def find_action_scavenger
    @action_scavenger = ActionScavenger.find(params[:action_scavenger_id])
  end

  def find_challenge
    @challenge ||= Challenge.find(params[:challenge_id])
  end
end
