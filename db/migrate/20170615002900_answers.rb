class Answers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :user, index: true, foreign_key: true
      t.references :choice, index: true, foreign_key: true

  end
end
end
