class CreateJoinTableClassifyPost < ActiveRecord::Migration[5.0]
  def change
    create_join_table :Classifies, :Posts do |t|
      # t.index [:classify_id, :post_id]
      # t.index [:post_id, :classify_id]
    end
  end
end
