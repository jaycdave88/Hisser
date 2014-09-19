class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |r|
      r.integer :user_id
      r.integer :following_id
      r.timestamps
    end
  end
end
