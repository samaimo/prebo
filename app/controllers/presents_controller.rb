class PresentsController < ApplicationController
  before_action :set_present, only: [:show, :edit]

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
  end

  def update
    if @present.update(present_params)
      redirect_to edit_present_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @present = Present.find(params[:id])
    @present.destroy if @present.user == current_user
    redirect_to root_path
  end

  private

  def set_present
    @boxes = Box.all
    @box = Box.find(params[:id])
    @present = Present.find(params[:id])
  end

  def present_params
    params.require(:present).permit(:title, :event_name, :text, :price, :memo, :present_name,
                                    :url, :box_id, :image).merge(user_id: current_user.id)
  end
end
