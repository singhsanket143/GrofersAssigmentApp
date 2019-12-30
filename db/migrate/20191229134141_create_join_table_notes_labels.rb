class CreateJoinTableNotesLabels < ActiveRecord::Migration[5.1]
  def change
    create_join_table :notes, :labels do |t|
      # t.index [:note_id, :label_id]
      # t.index [:label_id, :note_id]
    end
  end
end
