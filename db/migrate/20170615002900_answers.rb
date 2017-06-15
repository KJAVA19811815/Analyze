class Answers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      add_reference :users, index: true, foreign_key: true
      add_reference :options, index: true, foreign_key: true

  end
end
end
