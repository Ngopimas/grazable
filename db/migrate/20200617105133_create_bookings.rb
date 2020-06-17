class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.date :starts_on
      t.date :ends_on
      t.references :user, null: false, foreign_key: true
      t.references :animal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
