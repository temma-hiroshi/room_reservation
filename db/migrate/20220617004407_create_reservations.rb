class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.date :start_day
      t.date :end_day
      t.integer :number_of_people
      t.integer :user_id
      t.integer :room_id

      t.timestamps
    end
  end
end
