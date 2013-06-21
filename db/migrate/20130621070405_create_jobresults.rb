class CreateJobresults < ActiveRecord::Migration
  def change
    create_table :jobresults do |t|

      t.timestamps
    end
  end
end
