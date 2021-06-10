class ChangeDataTypeofColumns < ActiveRecord::Migration[6.1]
  def change
    remove_column :kittens, :softness
    remove_column :kittens, :cuteness
    add_column :kittens, :softness, :integer
    add_column :kittens, :cuteness, :integer
  end
end
