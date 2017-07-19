class RememberNotesController < ApplicationController
  before_action :set_remember_note, only: [:show, :edit, :update, :destroy]

  # GET /remember_notes
  # GET /remember_notes.json
  def index
    @remember_note  = RememberNote.new

    if params[:start_date].present? && params[:end_date].present?
      start_date = params[:start_date]
      end_date   = params[:end_date]
    end


    @remember_notes = RememberNote.all
    @remember_notes = @remember_notes.where(created_at: start_date..end_date) if start_date && end_date
    @remember_notes = @remember_notes.where("lower(title) LIKE '%#{params[:key_words]}%' OR lower(description) LIKE '%#{params[:key_words]}%'") if params[:key_words].present?
  end

  # GET /remember_notes/1
  # GET /remember_notes/1.json
  def show
  end

  # GET /remember_notes/new
  def new
    @remember_note = RememberNote.new
  end

  # GET /remember_notes/1/edit
  def edit
  end

  # POST /remember_notes
  # POST /remember_notes.json
  def create
    @remember_note = RememberNote.new(remember_note_params)

    respond_to do |format|
      if @remember_note.save
        format.html { redirect_to @remember_note, notice: 'Remember note was successfully created.' }
        format.json { render :show, status: :created, location: @remember_note }
      else
        format.html { render :new }
        format.json { render json: @remember_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /remember_notes/1
  # PATCH/PUT /remember_notes/1.json
  def update
    respond_to do |format|
      if @remember_note.update(remember_note_params)
        format.html { redirect_to @remember_note, notice: 'Remember note was successfully updated.' }
        format.json { render :show, status: :ok, location: @remember_note }
      else
        format.html { render :edit }
        format.json { render json: @remember_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /remember_notes/1
  # DELETE /remember_notes/1.json
  def destroy
    @remember_note.destroy
    respond_to do |format|
      format.html { redirect_to remember_notes_url, notice: 'Remember note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_remember_note
      @remember_note = RememberNote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def remember_note_params
      params.require(:remember_note).permit(:title, :description)
    end
end
