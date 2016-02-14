class PinsController < ApplicationController

  def index
    @pins = Pin.all
  end

  def new
    @pin = Pin.new
  end

  def create
    @pin = Pin.new(pin_params)

    if @pin.save
      flash[:notice] = "This is successfully created"
      redirect_to pin_path(@pin)
    else
      render 'new'
    end
  end

  def show
    @pin = Pin.find(params[:id])
  end

  def edit
    @pin = Pin.find(params[:id])
  end

  def update
    if @pin.update(pin_params)
      flash[:notice] = "This is successfully updated"
      redirect_to pin_path(@pin)
    else
      render 'edit'
    end
  end

  def destroy
  end

  private
    def pin_params
      params.require(:pin).permit(:title, :description, :image)
    end

end
