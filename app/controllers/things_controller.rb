class ThingsController < ApplicationController
  before_action :set_thing, only: [:show, :edit, :update, :destroy, :countup, :countdown]

  def index
    @things = Thing.all
  end

  def show
  end

  def new
    @thing = Thing.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
  end

  def create
    @thing = Thing.new(thing_params)

    if @thing.save
      respond_to do |format|
        format.html do
          flash[:success] = "#{@thing.name} was successfully created"
          redirect_to @thing
        end
        format.js
      end
    else
      render :new
    end
  end

  def update
    if @thing.update(thing_params)
      respond_to do |format|
        format.html do
          flash[:success] = "#{@thing.name} was successfully updated"
          redirect_to @thing
        end
        format.js
      end
    else
      render :edit
    end
  end

  def destroy
    @thing.destroy
    respond_to do |format|
      format.html do
        flash[:success] = "#{@thing.name} was successfully destroyed"
        redirect_to things_url
      end
      format.js
    end
  end

  # JS response.
  def countup
    @thing.count += 1
    @thing.save
  end

  # JS response.
  def countdown
    @thing.count -= 1
    @thing.save
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_thing
      @thing = Thing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def thing_params
      params.require(:thing).permit(:name, :count)
    end
end
