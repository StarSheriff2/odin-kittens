class ChangeColumnsToKittens < ActiveRecord::Migration[6.1]
  def change
    change_column :kittens, :softness, :integer
    change_column :kittens, :cuteness, :integer
  end
end
