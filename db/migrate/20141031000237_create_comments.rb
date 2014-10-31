class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :sentence
      t.belongs_to :user
      t.text :body

      t.timestamps
    end
  end
end