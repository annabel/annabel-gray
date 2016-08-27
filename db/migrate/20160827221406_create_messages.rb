class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :name, null: false
      t.text :content, null: false
      t.string :email, null: false
    end
  end
end
