class CreatePiDigits < ActiveRecord::Migration[5.1]
  def change
    create_table :pi_digits do |t|
      t.integer :digit, null: false
      t.integer :two_digits, null: false
      t.integer :three_digits, null: false
      t.integer :four_digits, null: false
      t.integer :five_digits, null: false
      t.integer :six_digits, null: false
      t.integer :seven_digits, null: false
      t.integer :eight_digits, null: false
      t.integer :nine_digits, null: false
      t.integer :ten_digits, null: false
    end
    
    add_index :pi_digits, :digit
  end
end
