class CreateCapps < ActiveRecord::Migration
  def self.up
    create_table :capps do |t|
      t.string :title

      t.timestamps
    end
  end

  def self.down
    drop_table :capps
  end
end
