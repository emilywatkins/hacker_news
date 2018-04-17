class LinksController < ApplicationController
  def index
    @links = Link.all
  end

  def show
    @link = Link.find(params[:id])
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      flash[:notice] = "Link successfully added"
      redirect_to links_path
    else
      render :new
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
  @link = Link.find(params[:id])
  if @link.update(link_params)
    flash[:notice] = "Updated link"
    redirect_to links_path
  else
    flash[:alert] = "Try again error occured"
    render :edit
  end
end

def destroy
  @link = Link.find(params[:id])
  @link.destroy
  redirect_to links_path
end

private
  def link_params
    params.require(:link).permit(:headline, :url)
  end
end
