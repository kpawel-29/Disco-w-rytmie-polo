class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :autor
      t.text :description
      t.references :gist, index: true

      t.timestamps
    end
  end
end
