class ManufacturerController < ApplicationController
  def index
    @manufacturers = Manufacturer.all 
  end

  def new
    @manufacturer = Manufacturer.new
  end

  def create
  end

  protected

  def manufacturer_params
  end
end
