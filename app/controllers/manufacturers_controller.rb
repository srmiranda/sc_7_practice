class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.all
  end

  def new
    @manufacturer = Manufacturer.new
  end

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)
    if @manufacturer.save
      flash[:notice] = "New Manufacturer Added Successfully!"
      redirect_to manufacturers_path
    else
      flash[:errors] = @manufacturer.errors.full_messages.join(", ")
      render :new
    end
  end

  protected

  def manufacturer_params
    params.require(:manufacturer).permit(:name, :country)
  end
end
