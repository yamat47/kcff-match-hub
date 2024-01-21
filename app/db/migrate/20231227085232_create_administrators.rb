# frozen_string_literal: true

class CreateAdministrators < ActiveRecord::Migration[7.1]
  def change
    create_table :administrators, comment: '管理者' do |t|
      t.string :email, null: false, index: { unique: true }, comment: 'メールアドレス'
      t.string :universal_id, null: false, index: { unique: true }, comment: 'ユニバーサルID'

      t.timestamps
    end
  end
end
