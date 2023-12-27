# frozen_string_literal: true

class CreateAdministrators < ActiveRecord::Migration[7.1]
  def change
    create_table :administrators, comment: '管理者' do |t|
      t.string :email, null: false, index: { unique: true }, comment: 'メールアドレス'
      t.string :name, null: false, index: { unique: true }, comment: '名前'

      t.timestamps
    end
  end
end
