class AddMissionToHabits < ActiveRecord::Migration[6.0]
  def change
    add_reference :habits, :mission, null: false, foreign_key: true
  end
end
