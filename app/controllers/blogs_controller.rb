class BlogsController < ApplicationController

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
    # @つけると、対応するviewで使える。
    # ブログモデルと紐づいた(データを入れるための)空の箱を定義
    # インスタンスという。
  end

  def show
    @blog = Blog.find(params[:id])
    # findメソッドはidを使ってモデルからレコードを探す
  end

  def create
    blog = Blog.new(blog_params)
    # ビューから送られてきたデータをblogという空き箱に入れてる
    blog.save
    redirect_to "/blogs"
    # ほかのビューに移動するメソッド
  end

  private
    def blog_params
      params.require(:blog).permit(:title, :body, :category)
      # ビューから送信されたデータはparamsというメソッドの中に入っている。
      # ストロングパラメータは、セキュリティを強固にしてるもの
    end
end
