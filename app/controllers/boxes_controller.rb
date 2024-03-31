class BoxesController < ApplicationController
  before_action :set_box, only: [:edit, :show, :destroy]
  before_action :move_to_index, except: [:index, :show,:destroy]

  def index
    @boxes = Box.includes(:user).order('created_at DESC')
  
  end

  def new
    @box = Box.new
    
  end

  def create
    @box = Box.new(box_params)
    if @box.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show

  end


  def edit
  end

  def destroy
    if @box.user == current_user
      @box.destroy
    end
      redirect_to root_path
  end


  private
  def box_params
    params.require(:box).permit(:box_name,
                                 :image).merge(user_id: current_user.id)
  end

  def set_box
    @box = Box.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
