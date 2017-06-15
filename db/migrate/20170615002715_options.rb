class Options < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string :options_name
      add_reference :questions, index: true, foreign_key: true



  end
end
end
