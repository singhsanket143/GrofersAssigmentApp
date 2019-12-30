class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  # GET /notes
  # GET /notes.json
  def index
    if params[:title].present?
      @notes = Note.where('title LIKE ?', "%#{params[:title]}%").order created_at: :desc
    elsif params[:labels].present?
      labels = params[:labels].split(',')
      @notes = Note.joins('join labels_notes on notes.id = labels_notes.note_id').where('labels_notes.label_id in (?)',Label.all.where('name in (?)', labels).select(:id)).uniq
    else
      @notes = Note.all.order created_at: :desc
    end

    if params[:start_date].present? and params[:end_date].present?
      start_date = params[:start_date].split('/')
      end_date = params[:end_date].split('/')
      start_date = [start_date[2], start_date[0], start_date[1]].join('-') + ' 00:00:00'
      end_date = [end_date[2], end_date[0], end_date[1]].join('-') + ' 00:00:00'
      if params[:labels].present?
        labels = params[:labels].split(',')
        @notes = Note.where('created_at BETWEEN ? AND ?',Date.strptime(start_date.to_time.to_s), Date.strptime(end_date.to_time.to_s)).joins('join labels_notes on notes.id = labels_notes.note_id').where('labels_notes.label_id in (?)',Label.all.where('name in (?)', labels).select(:id)).uniq
      else
        @notes = Note.where('created_at BETWEEN ? AND ?',Date.strptime(start_date.to_time.to_s), Date.strptime(end_date.to_time.to_s))
      end
    end
    @labels = Label.all
    @note = Note.new
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
  end

  # GET /notes/new
  def new
    @note = Note.new
  end

  # GET /notes/1/edit
  def edit
    @labels = Label.all
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = Note.new(note_params)
    if current_user.nil?
      return
    else
      @note.user_id = current_user.id
    end
    if params['labels'].present?
      labels = params['labels'].split(',')
      @note.labels << Label.all.where('name in (?)', labels)
    end
    respond_to do |format|
      if @note.save
        format.js {}
        format.html { redirect_to @note, notice: 'Note was successfully created.' }
        format.json { render :show, status: :created, location: @note }
      else
        format.js {}
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    respond_to do |format|
      if @note.update(note_params)
        if params['labels'].present?
          labels = params['labels'].split(',')
          @note.labels.clear
          @note.labels << Label.all.where('name in (?)', labels)
        end
        format.html { redirect_to '/', notice: 'Note was successfully updated.' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url, notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_note
    @note = Note.find(params[:id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def note_params
    params.require(:note).permit(:title, :description, :user_id, :is_completed)
  end
end
