class CreateAlligators < ActiveRecord::Migration
  def change
    create_table :alligators do |t|
      t.string :name

      t.timestamps
    end
  end
end
