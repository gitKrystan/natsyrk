class Admin::EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]

  # GET /admin/entries
  def index
    @entries = Entry.all
  end

  # GET /admin/entries/new
  def new
    @entry = Entry.new
  end

  # GET /admin/entries/1/edit
  def edit
  end

  # POST /admin/entries
  def create
    @entry = Entry.new(entry_params)

    if @entry.save
      redirect_to @entry, notice: 'Entry was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/entries/1
  def update
    if @entry.update(entry_params)
      redirect_to @entry, notice: 'Entry was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/entries/1
  def destroy
    @entry.destroy
    redirect_to admin_entries_path, notice: 'Entry was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def entry_params
      params.require(:entry).permit(:name, :link, :content)
    end
end
