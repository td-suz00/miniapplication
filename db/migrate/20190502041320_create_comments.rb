class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :title, null: false
      t.text   :text, null: false

      t.timestamps  null: false
    end
  end
end
