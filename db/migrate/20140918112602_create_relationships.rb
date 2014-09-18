class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |r|
      r.integer :follower_id
      r.integer :followed_id
      r.timestamps
    end
  end
end
