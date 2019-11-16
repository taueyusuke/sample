class CreateConferencerooms < ActiveRecord::Migration[5.2]
  def change
    create_table :conferencerooms do |t|
      t.integer :people, null: false
      t.integer :price, null: false
      t.time :availabletime, null: false
      t.text :remarks
      t.references :facility, foreign_key: true, null: false

      t.timestamps
    end
  end
end
