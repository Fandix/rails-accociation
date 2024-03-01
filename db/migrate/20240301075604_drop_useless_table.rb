class DropUselessTable < ActiveRecord::Migration[7.1]
  def change
    drop_table :appointments
    drop_table :patients
    drop_table :physicians
  end
end
