class MenusController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]


  def index
    # @dinner = Dinner.all.order("RAND()").limit(6)
  end
  
  def new
    @menu = Menu.new
  end
  
  def create
    @menu = Menu.new(menu_params)
    if @menu.save
      redirect_to root_path
    else
      render:new
    end
  end

  def new_guest
    user = User.find_or_create_by(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
    if sign_in user
      redirect_to root_path, notice: 'Signed in successfully'
    else
      redirect_to root_path, notice: 'ダメでした'
    end
  end

  private

  def menu_params
    params.require(:menu).permit(:main_name, :main_recipe, :main_genre, :salad_name, :salad_recipe, :salad_genre, :soup_name, :soup_recipe, :soup_genre).merge(user_id: current_user.id)

  end

end
