# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[5.1] # :nodoc:
  def change
    create_table :posts, comment: 'text content posted. New post or reply comments are all posts.' do |t|
      t.text :content, comment: 'text content'
      t.string :author, comment: 'author name'
      t.string :email, comment: 'email'
      t.references :topic, index: true

      t.timestamps null: false
    end
    add_foreign_key :posts, :topics
  end
end
