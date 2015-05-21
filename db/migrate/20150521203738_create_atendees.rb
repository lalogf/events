class CreateAtendees < ActiveRecord::Migration
  def change
    create_table :atendees do |t|
      t.string :name
      t.string :lastname
      t.string :email
      t.string :phone
      t.string :company

      t.timestamps null: false
    end
  end
end
