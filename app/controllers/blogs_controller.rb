class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :update, :destroy]

  # GET /blogs
  def index
    @blogs = Blog.all

    render json: @blogs, except: [:created_at, :updated_at, :author_id], include: [:author]
  end

  # GET /blogs/1
  def show
    render json: @blog
  end

  # POST /blogs
  def create
    @blog = Blog.new(blog_params)

    if @blog.save
      render json: @blog, status: :created, location: @blog, except: [:created_at, :updated_at, :author_id], include: [:author]
    else
      render json: @blog.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /blogs/1
  def update
    if @blog.update(blog_params)
      render json: @blog, except: [:created_at, :updated_at, :author_id], include: [:author]
    else
      render json: @blog.errors, status: :unprocessable_entity
    end
  end

  # DELETE /blogs/1
  def destroy
    @blog.destroy

    render json: @blog
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def blog_params
      params.require(:blog).permit(:title, :content, :author_attributes)
    end
end
