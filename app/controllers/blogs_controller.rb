class BlogsController < ApplicationController
  respond_to :html, :js, :json

  def index
    respond_with(@blogs = Blog.all)
  end

  def new
    respond_with(@blog = Blog.new)
  end

  def edit
    respond_with(@blog = Blog.find(params[:id]))
  end

  def show
    # redirect_to blogs_url
    respond_with(@blog = Blog.find(params[:id]))
  end

  def create
    @blog = Blog.new(params[:blog])

    if @blog.save
      respond_with @blog do |format|
        format.html {redirect_to blogs_url, notice: 'You have successfully added your blog.'}
        format.js
      end
    else
      respond_with @blog do |format|
        format.html {render action: "new"}
        format.js {render 'new.js.erb'}
      end
    end
  end

  def update
    @blog = Blog.find(params[:id])

    if @blog.update_attributes(params[:blog])
      respond_with @blog do |format|
        format.html {redirect_to blogs_url, notice: 'You have successfully updated your blog.'}
        format.js
      end
    else
      respond_with @blog do |format|
        format.html {render action: "edit"}
        format.js {render 'new.js.erb'}
      end
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_url, :notice => 'You have successfully removed your blog.'
  end
end