class AddSentencesTable < ActiveRecord::Migration[6.1]
  def change
    create_table :sentences do |t|
      t.text :words
    end
  end
end
