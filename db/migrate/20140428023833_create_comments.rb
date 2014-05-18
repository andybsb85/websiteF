class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
       t.timestamps
    end
     create_table :comment_translations do |t|
      t.string :locale
      t.references :comment
      t.belongs_to :user
      t.string :title
      t.text :description
      t.timestamps
    end
  end
  def self.down
    drop_table :comments
    drop_table :comment_translations
  end
end
