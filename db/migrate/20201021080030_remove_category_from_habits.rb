class RemoveCategoryFromHabits < ActiveRecord::Migration[6.0]
  def change
    remove_reference :habits, :category, null: false, foreign_key: true
  end
end
