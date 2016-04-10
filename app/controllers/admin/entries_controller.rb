class Admin::EntriesController < ApplicationController
  # GET /admin/entries
  def index
    @entries = Entry.all
  end

  # GET /admin/entries/new
  def new
    Entry.load_starred
    redirect_to admin_entries_path
  end
end
