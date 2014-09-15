class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :status
      t.integer :winner_id 

      t.timestamps
    end
  end
end
