class CreatePiDigits < ActiveRecord::Migration[5.1]
  def change
    create_table :pi_digits do |t|
      t.integer :digit, limit: 8, null: false
      t.integer :two_digits, limit: 8, null: true
      t.integer :three_digits, limit: 8, null: true
      t.integer :four_digits, limit: 8, null: true
      t.integer :five_digits, limit: 8, null: true
      t.integer :six_digits, limit: 8, null: true
      t.integer :seven_digits, limit: 8, null: true
      t.integer :eight_digits, limit: 8, null: true
      t.integer :nine_digits, limit: 8, null: true
      t.integer :ten_digits, limit: 8, null: true
    end

    add_index :pi_digits, :digit
  end
end
