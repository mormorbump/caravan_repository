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

  def edit
    @blog = Blog.find(params[:id])
  end

  def create
    blog = Blog.new(blog_params)
    # ビューから送られてきたデータをblogという空き箱に入れてる
    blog.save
    redirect_to "/blogs"
    # ほかのビューに移動するメソッド
     # binding.pry
    # コンソールに入りたい場所でこれを記述
  end

  def update
    blog = Blog.find(params[:id])
    blog.update(blog_params)
    # redirect_to "/blogs/#{blog.id}
    redirect_to blog_path(blog.id)
    # rake routesで確認できるprefix(名前付きパス)を使用
    # redirect_to blog_path(blog)
    # redirect_to blog
  end

  def destroy
    blog = Blog.find(params[:id])
    blog.destroy
    redirect_to blogs_path
  end

  private
    def blog_params
      params.require(:blog).permit(:title, :body, :category, :blog_image)
      # ビューから送信されたデータはparamsというメソッドの中に入っている。
      # ストロングパラメータは、セキュリティを強固にしてるもの
    end
end
