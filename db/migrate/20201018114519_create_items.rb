class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name,             null: false
      t.text       :text,             null: false
      t.integer    :category_id,      null: false
      t.integer    :status_id,        null: false
      t.integer    :delivery_fee_id,  null: false
      t.integer    :sender_area_id,   null: false
      t.integer    :number_of_day_id, null: false
      t.integer    :money,            null: false
      t.references :user,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
