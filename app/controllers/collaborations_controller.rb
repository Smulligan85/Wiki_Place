class CollaborationsController < ApplicationController

def manage
  @wiki = Wiki.find(params[:wiki_id]) 
  if ManageCollaborations.call(@wiki, params[:user_ids])
    flash[:notice] = 'Collabos updated!'
    redirect_to @wiki
  else
    flash[:alert] = 'Fail!'
    redirect_to @wiki
  end 
end
end