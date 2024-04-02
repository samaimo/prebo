class PresentsController < ApplicationController
  def index
    @boxes = Box.all
    @presents = Present.all
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
  

  private
  def present_params
    params.require(:present).permit(:title, :event_name, :text, :price, :memo, :present_name,
                                 :url,:box_id, :image).merge(user_id: current_user.id)
  end
end
