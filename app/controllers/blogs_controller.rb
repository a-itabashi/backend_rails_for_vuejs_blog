class BlogsController < ApplicationController
  def index
    blogs = Blog.all
    render json: blogs
  end

  def create
    blog = Blog.new(blog_params)
    if blog.save
      head :created
    else
      render json: { errors: blog.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    blog = Blog.find(params[:id])
    render json: blog
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :contents)
  end
end
