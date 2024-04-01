class CreateBoxes < ActiveRecord::Migration[7.0]
  def change
    create_table :boxes do |t|
      t.string         :box_name,            null: false
      t.date           :birth_day
      t.text           :memo
      t.string         :favorite_color
      t.date           :anniversary_day
      t.text           :anniversary_memo
      t.string         :occupation
      t.string         :hobbies
      t.string         :likes
      t.string         :dislikes
      t.references     :user,            null:false, foreign_key: true
      t.timestamps
    end
  end
end
