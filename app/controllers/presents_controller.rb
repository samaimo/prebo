class PresentsController < ApplicationController
  before_action :set_present, only: [:show, :edit, :update, :destroy]

  def index
    @boxes = Box.all.order('created_at DESC')
    @presents = Present.all.order('created_at DESC')
  end

  def new
    @present = Present.new
    @boxes = Box.all # プレゼント作成画面でも箱の情報を使う場合
  end

  def create
    @present = Present.new(present_params)
    if @present.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    return if @present.user == current_user

    redirect_to root_path
  end

  def update
    if @present.update(present_params)
      redirect_to present_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @present.destroy if @present.user == current_user
    redirect_to root_path
  end

  private

  def set_present
    @present = Present.find(params[:id])
    @boxes = Box.all
    @box = Box.find(@present.box_id)
  end

  def present_params
    params.require(:present).permit(:title, :event_name, :text, :price, :memo, :present_name, :shop,
                                    :url, :box_id, :image).merge(user_id: current_user.id)
  end
end
