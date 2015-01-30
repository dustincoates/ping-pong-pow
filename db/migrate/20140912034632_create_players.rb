class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.integer :match_id, null: false
      t.integer :user_id, null: false
      t.boolean :winner, default: false
    end
  end
end

