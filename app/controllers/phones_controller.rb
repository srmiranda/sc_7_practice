class PhonesController < ApplicationController
  def index
    @phones = Phone.all
  end

  def new
    @phone = Phone.new
  end

  def create
    @phone = Phone.new(phone_params)
    if @phone.save
      flash[:notice] = "New cell phone added"
      redirect_to phones_path
    else
      flash[:errors] = @phone.errors.full_messages.join(", ")
      render :new
    end
  end

  protected

  def phone_params
    params.require(:phone).permit(:year, :battery, :manufacturer_id, :description)
  end
end
