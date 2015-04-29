class PropertiesController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
  before_action :set_property, only: [:show, :edit, :update, :destroy]
  # GET /properties
  # GET /properties.json
  def index
    if params[:q]
        @properties = Property.find_all_by_query(params[:q])
        
        elsif params[:b]
            @properties = Property.find_all_by_bedroom(params[:b])
            
            elsif params[:ba]
            @properties = Property.find_all_by_bathroom(params[:ba])
            
            elsif params[:r]
            @properties = Property.find_all_by_rent(params[:r])
            
            elsif params[:p]
            @properties = Property.find_all_by_pets(params[:p])
            
            elsif params[:u]
            @properties = Property.find_all_by_utilities(params[:u])
            
            elsif params[:z]
            @properties = Property.find_all_by_zip(params[:z])
        else
        @properties = Property.all
    end
  end
  
  # GET /properties/1
  # GET /properties/1.json
  def show
  end

  # GET /properties/new
  def new
    @property = Property.new
  end

  # GET /properties/1/edit
  def edit
  end

  # POST /properties
  # POST /properties.json
  def create
    @property = Property.new(property_params)

    respond_to do |format|
      if @property.save
        format.html { redirect_to @property, notice: 'Property was successfully created.' }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /properties/1
  # PATCH/PUT /properties/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to @property, notice: 'Property was successfully updated.' }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1
  # DELETE /properties/1.json
  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: 'Property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_params
      params.require(:property).permit(:address, :city, :state, :zip, :bedrooms, :bathrooms, :rent, :pets, :utilities, :description)
    end
end
