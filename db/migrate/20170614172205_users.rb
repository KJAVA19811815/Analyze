class Users < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_type
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :age
      t.string :sex
      t.string :religion
      t.string :ethnicity
      t.integer :income
      t.datetime :created_at
      t.datetime :updated_at

    end
  end
end
