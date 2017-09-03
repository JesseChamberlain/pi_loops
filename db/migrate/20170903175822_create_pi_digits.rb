class CreatePiDigits < ActiveRecord::Migration[5.1]
  def change
    create_table :pi_digits do |t|
      t.bigint :digit, null: false
      t.bigint :two_digits, null: true
      t.bigint :three_digits, null: true
      t.bigint :four_digits, null: true
      t.bigint :five_digits, null: true
      t.bigint :six_digits, null: true
      t.bigint :seven_digits, null: true
      t.bigint :eight_digits, null: true
      t.bigint :nine_digits, null: true
      t.bigint :ten_digits, null: true
    end
  end
end
