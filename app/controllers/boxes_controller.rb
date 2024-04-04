class BoxesController < ApplicationController
  before_action :set_box, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, except: [:index, :update, :show, :destroy]

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
    redirect_to root_path unless @box.user == current_user
  end

  def update
    if @box.update(box_params)
      redirect_to box_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @box.destroy if @box.user == current_user
    redirect_to root_path
  end

  private

  def box_params
    params.require(:box).permit(:box_name, :"birth_day(1i)", :"birth_day(2i)", :"birth_day(3i)",
                                :"anniversary_day(1i)", :"anniversary_day(2i)", :"anniversary_day(3i)", :anniversary_memo,
                                :occupation, :hobbies, :likes, :dislikes,
                                :image).merge(user_id: current_user.id)
  end

  def set_box
    @box = Box.find(params[:id])
  end

  def move_to_index
    return if user_signed_in?

    redirect_to action: :index
  end
end
