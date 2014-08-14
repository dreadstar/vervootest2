class NonprofitsController < ApplicationController
  before_action :set_nonprofit, only: [:show, :edit, :update, :destroy]

  def index
    @nonprofits = Nonprofit.all
  end

  def show
  end

  # GET /nonprofits/new
  def new
    @nonprofit = Nonprofit.new
  end

  # GET /nonprofits/1/edit
  def edit
  end

  def create
    @nonprofit = Nonprofit.new(nonprofit_params)

    respond_to do |format|
      if @nonprofit.save
        format.html { redirect_to @nonprofit, notice: 'Nonprofit was successfully created.' }
        format.json { render action: 'show', status: :created, location: @nonprofit }
      else
        format.html { render action: 'new' }
        format.json { render json: @nonprofit.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @nonprofit.update(nonprofit_params)
        format.html { redirect_to @nonprofit, notice: 'Nonprofit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @nonprofit.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @nonprofit.destroy
    respond_to do |format|
      format.html { redirect_to nonprofits_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nonprofit
      @nonprofit = Nonprofit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nonprofit_params
      params.require(:nonprofit).permit(:email, :enabled, :name, :address1, :address2, :city, :state, :province, :postal_code, :country, :phone_number, :img_url, :website, :seo_name, :img_thumb_url)
    end
end
