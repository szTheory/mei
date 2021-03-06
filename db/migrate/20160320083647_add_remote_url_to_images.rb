# frozen_string_literal: true

class AddRemoteUrlToImages < ActiveRecord::Migration[5.1] # :nodoc:
  def change
    add_column :images, :remote_url, :string, after: :image, comment: 'url of image fetched from'
    add_index :images, :remote_url
  end
end
