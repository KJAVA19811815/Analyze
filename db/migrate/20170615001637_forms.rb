class Forms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.string :name
      t.text :description
  end
end
end
