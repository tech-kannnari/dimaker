class DinnersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create, :show]

  def index
    @dinner = Dinner.all.order('created_at DESC')
  end

  def new
    @random = Menu.order('RAND()').limit(1)
    @dinner = Dinner.new
  end

  def create
    @random = Menu.order('RAND()').limit(1)
    @dinner = Dinner.new(dinner_params)
    if @dinner.save
      redirect_to root_path
    else
      flash.now[:notice] = '空の項目があると登録できません'
      render :new
    end
  end

  def show
    @dinner = Dinner.find(params[:id])
  end

  private

  def dinner_params
    params.require(:dinner).permit(:image, :impression, :cookday).merge(user_id: current_user.id)
  end
end
