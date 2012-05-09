class CreateRoosters < ActiveRecord::Migration
  def change
    create_table :roosters do |t|
      t.string :kind
      t.integer :awesomeness

      t.timestamps
    end
  end
end
