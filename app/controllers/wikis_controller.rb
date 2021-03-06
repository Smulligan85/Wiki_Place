class WikisController < ApplicationController
  def index
    @wikis = Wiki.all
  end

  def show
    @wiki = Wiki.find(params[:id])
    authorize @wiki
    @users = User.where.not(id: current_user.id)
  end

  def new
    @wiki = Wiki.new
    @users = User.all
    authorize @wiki
  end

  def create
    @wiki = current_user.wikis.create(wiki_params)
    authorize @wiki
      if @wiki.save
        flash[:notice] = "Wiki was saved. Huzzah!"
        redirect_to @wiki
      else
        flash[:error] = "There was an error saving the wiki. Please try again."
        render :new
      end
  end

  def edit
    @wiki = Wiki.find(params[:id])
    @users = User.all
    authorize @wiki
  end

  def update
    @wiki = Wiki.find(params[:id])
    authorize @wiki
    if @wiki.update_attributes(wiki_params)
      flash[:notice] = "Wiki updated."
      redirect_to @wiki
    else
      flash[:error] = "Wiki could not be updated. Please try again."
      render :edit
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])
    if @wiki.destroy
      flash[:notice] = "Wiki no more..."
      redirect_to wikis_path
    else
      flash[:error] = "Could not destroy Wiki. Please try again."
      render :show
    end
  end


  private

  def wiki_params
    params.require(:wiki).permit(:title, :body, :private)
  end
end
