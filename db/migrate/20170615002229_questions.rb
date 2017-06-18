class Questions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :form, index: true, foreign_key: true
      t.text :question_name

  end
end
end
