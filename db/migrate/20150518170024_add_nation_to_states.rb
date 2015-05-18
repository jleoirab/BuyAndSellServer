class AddNationToStates < ActiveRecord::Migration
  def change
    add_reference :states, :nation, index: true
  end
end
