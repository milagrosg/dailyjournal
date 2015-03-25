class EntriesController < ApplicationController
  def index
    @entries = Entry.all
  end

  def new
  end

  def create
    entry_params = params["entry"].permit("title", "contents")
    entry = Entry.create(entry_params)
    redirect_to(entry_path(entry))
  end

  def show
    @entry = Entry.find(params["id"])
  end

  def edit
    @entry = Entry.find(params["id"])
  end

  def update
    entry_params = params["entry"].permit("title", "contents")
    entry = Entry.find(params["id"])
    entry.update(entry_params)
    redirect_to(entry_path(entry))
  end

  def destroy
    Entry.find(params[:id]).destroy
    flash[:success] = "Entry deleted"
    redirect_to entries_path
  end
end


  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end