class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :status, default: 'not started'
 
      t.timestamps
    end
  end
end
