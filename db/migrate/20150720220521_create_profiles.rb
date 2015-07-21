class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :username
      t.string :email
      t.attachment :picture
      t.string :description

      t.timestamps null: false
    end
  end
end
