class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username, null: false, unique: true, index: true
      t.timestamps
    end

    create_table :polls do |t|
      t.references :poller, null: false, foreign_key: {to_table: :users}
      t.string :title, null: false

      t.timestamps
    end

    create_table :questions do |t|
      t.text :question, null: false
      t.references :poll, null: false, foreign_key: {to_table: :polls}

      t.timestamps
    end

    create_table :answerchoices do |t|
      t.references :question, null: false, foreign_key: {to_table: :questions}
      t.text :choice, null: false

      t.timestamps
    end

    create_table :responses do |t|
      t.references :responder, null: false, foreign_key: {to_table: :users}
      t.references :response_choice, null: false, foreign_key: {to_table: :answerchoices}

      t.timestamps
    end


  end
end
