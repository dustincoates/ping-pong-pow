class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :status
      t.integer :winner

      t.timestamps
    end
  end
end
