# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[5.0]
=begin
  def change
    create_table :products do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
=end
=begin
  def change
    reversible do |dir|
      change_table :products do |t|
        dir.up   { t.change :price, :string }
        # dir.up : 데이터베이스 스키마 업그레이드
        dir.down { t.change :price, :integer }
        # dir.down : 데이터 베이스 롤백
      end
    end
  end
=end
  def up
    change_table :products do |t|
      t.change :price, :string
    end
  end
  #  == dir.up

  def down
    change_table :products do |t|
      t.change :price, :integer
    end
  end
  # == dir.down
end
