class TwittersController < ApplicationController
  before_action :set_twitter, only: [:show, :edit, :update, :destroy]
  def index
    @twitters = Twitter.all
  end

  def new
     if params[:back]
      @twitter = Twitter.new(twitter_params)
      else
       @twitter = Twitter.new
     end
  end
  
  def create
    @twitter = Twitter.new(twitter_params)
    if @twitter.save
      # 一覧画面へ遷移して"ツイートを作成しました！"とメッセージを表示します。
      redirect_to twitters_path, notice: "ツイートを作成しました！"
    else
      # 入力フォームを再描画します。
      render 'new'
    end
  end
  
    def confirm
    @twitter = Twitter.new(twitter_params)
    render :new if @twitter.invalid?
    end
  
  def show
    @twitter = Twitter.find(params[:id])
  end
  
  def edit
    @twitter = Twitter.find(params[:id])
  end
  
  def update
    @twitter = Twitter.find(params[:id])
    if @twitter.update(twitter_params)
      redirect_to twitters_path, notice: "ツイートを編集しました！"
    else
      render 'edit'
    end
  end
  
  def destroy
    @twitter.destroy
    redirect_to twitters_path, notice:"ツイートを削除しました！"
  end
  
  private
  
  def twitter_params
    params.require(:twitter).permit(:content)
  end
  
  def set_twitter
  @twitter = Twitter.find(params[:id])
  end
  
end