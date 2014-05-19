class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :oauth_token
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end

class CreateAuthorizations < ActiveRecord::Migration
  def change
    create_table :authorizations do |t|

      t.timestamps
    end
  end
end
