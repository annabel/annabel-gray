class DropMessages < ActiveRecord::Migration
  def change
    drop_table :messages do |t|
      t.string :name, null: false
      t.text :content, null: false
      t.string :email, null: false
    end
  end
end
