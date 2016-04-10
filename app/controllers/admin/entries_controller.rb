class Admin::EntriesController < ApplicationController
  before_action :set_entries

  # GET /admin/entries
  def index
  end

  # GET /admin/entries/new
  def new
    Entry.load_starred
    respond_to do |format|
      format.js {}
      format.html { redirect_to admin_entries_path }
    end
  end

  private

  def set_entries
    @entries = Entry.all
  end
end
