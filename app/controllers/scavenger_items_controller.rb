class ScavengerItemsController < ApplicationController
  before_action :find_challenge, only: [:new, :edit, :create, :update, :destroy, :add_prereq,:remove_prereq,:showqr]
  before_action :find_action_scavenger, except: [:index, :show, :add_prereq,:remove_prereq]
  before_action :find_scavenger_item, only: [:update, :destroy, :edit]
  before_action :find_scavenger_item2, only: [:showqr]

  def new
    @scavenger_item = ScavengerItem.new
  end

  def edit
  end

  def showqr
      render :showqr
  end

  def update
    if @scavenger_item.update(scavenger_items_params)
      redirect_to challenge_action_stub_path(@challenge, @action_scavenger.action_stub), notice: 'Item was successfully updated.'
    else
      render :edit
    end
  end

  def add_prereq
    @scavenger_item = ScavengerItem.where(id: params[:scavenger_item_id]).first
    @prereq = ScavengerItem.where(id: params[:prereq_id]).first

    return missing_option_error unless params[:prereq_id].present?

    if @prereq
      return already_added_error(@prereq) if @scavenger_item.prereqs.include?(@prereq)
      @scavenger_item.prereqs << @prereq
      @scavenger_item.save!

      flash[:notice] = "#{@prereq.name} was successfully added to this scavenger item"
    #   redirect_to challenge_path(@scavenger_item)
      redirect_to challenge_action_stub_path(@challenge, @action_scavenger.action_stub)
    else
      flash.now[:alert] = 'There was an error adding this pre-requisite to the scavenger item'
      render :show
    end
  end

  def remove_prereq
    @scavenger_item = ScavengerItem.where(id: params[:scavenger_item_id]).first
    @prereq = ScavengerItem.where(id: params[:id]).first

    if @prereq
      @scavenger_item.prereqs.delete(@prereq)
      flash[:notice] = "#{@prereq.name} has been removed from the scavenger item."
    #   redirect_to challenge_path(@scavenger_item)
      redirect_to challenge_action_stub_path(@challenge, @action_scavenger.action_stub)
    else
      flash.now[:alert] = 'The pre-requisite could not be found'
    end
  end

  def create
    @scavenger_item = ScavengerItem.new(scavenger_items_params.merge(action_scavenger_id: @action_scavenger.id).merge(public_id: SecureRandom.uuid))

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
    params.require(:scavenger_item).permit(:hint_msg, :found_msg, :order, :find_amt, :prereq_flag, :name)
  end

  def find_scavenger_item
    @scavenger_item = ScavengerItem.find(params[:id])
  end

  def find_scavenger_item2
    @scavenger_item = ScavengerItem.find(params[:scavenger_item_id])
  end

  def find_action_scavenger
    @action_scavenger = ActionScavenger.find(params[:action_scavenger_id])
  end

  def find_challenge
    @challenge ||= Challenge.find(params[:challenge_id])
  end

  def already_added_error(resource)
    flash.now[:alert]= "#{resource.name} has already been added to this Scavenger Item."
    # render :show
    redirect_to challenge_action_stub_path(@challenge, @action_scavenger.action_stub)
  end

  def missing_option_error
    flash.now[:alert]= "Please select an option."
    # render :show
    redirect_to challenge_action_stub_path(@challenge, @action_scavenger.action_stub)
  end
end
