class DinnersController < ApplicationController
  
  def index
    @dinner = Dinner.all.order('created_at DESC')
  end
  
  def new
    @random = Menu.order("RAND()").limit(1)
    @dinner = Dinner.new
  end

  def create
    @dinner = Dinner.new(dinner_params)
    if @dinner.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def dinner_params
    params.require(:dinner).permit(:image, :impression, :cookday).merge(user_id: current_user.id)
  end
end
