class AddEntitiesTable < ActiveRecord::Migration[6.1]
  def change
    create_table :entities do |t|
      t.string :text
      t.string :type # always for get the STI
    end
  end
end
