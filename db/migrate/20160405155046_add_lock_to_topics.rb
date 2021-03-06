# frozen_string_literal: true

class AddLockToTopics < ActiveRecord::Migration[5.1] # :nodoc:
  def change
    add_column :topics, :locked, :boolean, default: false, null: false, after: :max_pos, comment: 'prevent further replies'
  end
end
