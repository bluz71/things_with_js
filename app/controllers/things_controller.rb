class ThingsController < ApplicationController
  before_action :set_thing, only: [:show, :edit, :update, :destroy, :countup, :countdown]

  # GET /things
  # GET /things.json
  def index
    @things = Thing.all
  end

  # GET /things/1
  # GET /things/1.json
  def show
  end

  # GET /things/new
  def new
    @thing = Thing.new
  end

  # GET /things/1/edit
  def edit
  end

  def create
    @thing = Thing.new(thing_params)

    if @thing.save
      flash[:success] = "#{@thing.name} was successfully created"
      redirect_to @thing
    else
      render :new
    end
  end

  def update
    if @thing.update(thing_params)
      flash[:success] = "#{@thing.name} was successfully updated"
      redirect_to @thing
    else
      render :edit
    end
  end

  def destroy
    @thing.destroy
    flash[:success] = "#{@thing.name} was successfully destroyed"
    redirect_to things_url
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
