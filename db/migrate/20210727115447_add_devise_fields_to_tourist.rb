# frozen_string_literal: true

class AddDeviseFieldsToTourist < ActiveRecord::Migration[6.1]
  def change
    add_column :tourists, :encrypted_password, :string, null: false, default: ""
  
    add_index :tourists, :email, unique: true
  end
end
