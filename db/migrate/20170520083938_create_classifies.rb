class CreateClassifies < ActiveRecord::Migration[5.0]
  def change
    create_table :classifies do |t|
      t.string :name

      t.timestamps
    end
  end
end
