class HomesController < ApplicationController
  def index
    @homes = Home.all
  end

  def about
  end
  
  def page1
  end

  def show
    @home = Home.find(params[:id])
  end

  def adminshow
    @home = Home.find(params[:id])
  end

  def admin
    @homes = Home.all
  end

  def new
    @home = Home.new
  end

  def create
    @home = Home.new(home_params)

    if @home.save
      redirect_to @home
    else
      render :new
    end
  end

  def edit
    @home = Home.find(params[:id])
  end

  def update
    @home = Home.find(params[:id])

    if @home.update(home_params)
      redirect_to @home
    else
      render :edit
    end
  end

  def destroy
    @home = Home.find(params[:id])
    @home.destroy

    redirect_to home_admin_path
  end
  def success

  end
  
  private
  def home_params
    params.require(:home).permit(:image, :price, :location, :description, :size)
  end
 
 
end
