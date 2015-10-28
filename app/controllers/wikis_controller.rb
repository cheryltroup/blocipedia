class WikisController < ApplicationController
  before_action :get_wiki, only: [:edit, :update, :show, :destroy]

  def get_wiki
    @wiki = Wiki.find(params[:id])
  end

  def index
    @wikis = Wiki.visible_to(current_user)
    authorize @wikis
  end

  def show
    get_wiki
    #@wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
    authorize @wiki
  end

  def edit
    get_wiki
    #@wiki = Wiki.find(params[:id])
    @user = User.all
  end

  def create
    @wiki = Wiki.new(wiki_params)
    @wiki.user = current_user
    authorize @wiki
      if  @wiki.save
         flash[:notice] = "Wiki was saved."
         redirect_to @wiki
      else
       flash[:error] = "There was an error saving the wiki. Please try again."
       render :new
      end
  end

  def update
    get_wiki
    #@wiki = Wiki.find(params[:id])
    @wiki.update_attributes(wiki_params) # looks at user
    flash[:notice] = "Wiki was updated."
    redirect_to @wiki
  end


  def destroy
    get_wiki
    #@wiki = Wiki.find(params[:id])
    @wiki.destroy
    flash[:notice] = "Wiki was sucessfully deleted."
    redirect_to @wiki
  end


  private

def wiki_params
  params.require(:wiki).permit(:title, :body, :private)
end
end
