class Choices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.string :choices_name
      t.references :question, index: true, foreign_key: true



  end
end
end
