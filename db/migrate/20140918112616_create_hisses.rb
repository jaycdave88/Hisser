class CreateHisses < ActiveRecord::Migration
  def change
    create_table :hisses do |h|
      h.belongs_to :user
      h.integer :user_id
      h.string :hiss
      h.timestamps
    end
  end
end
