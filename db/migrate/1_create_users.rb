class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |a|
      a.string :snake_name
      a.string :firts_name
      a.string :last_name
      a.string :password
      a.string :email
      a.string :avatar

      a.timestamps
    end
  end
end
