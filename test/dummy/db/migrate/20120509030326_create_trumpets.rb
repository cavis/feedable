class CreateTrumpets < ActiveRecord::Migration
  def change
    create_table :trumpets do |t|
      t.string :brand
      t.string :loudness

      t.timestamps
    end
  end
end
