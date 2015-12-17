class AddCheckToSomething < ActiveRecord::Migration
  def change
    add_column :somethings, :check, :string
  end
end
