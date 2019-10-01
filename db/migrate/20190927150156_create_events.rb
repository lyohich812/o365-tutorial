class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events, :id => false do |t|
      t.string :id
      t.timestamp :created_date_time
      t.datetime :last_modified_date_time
      t.string :change_key
      t.string :categories
      t.string :original_start_time_zone
      t.string :original_end_time_zone
      t.string :response_status
      t.string :i_cal_u_id
      t.integer :reminder_minutes_before_start
      t.boolean :is_reminder_on
      t.boolean :has_attachments
      t.string :subject
      t.string :body
      t.string :body_preview
      t.string :importance
      t.string :sensitivity
      t.string :start
      t.string :end
      t.string :location
      t.boolean :is_all_day
      t.boolean :is_cancelled
      t.boolean :is_organizer
      t.string :recurrence
      t.boolean :response_requested
      t.string :series_master_id
      t.string :show_as
      t.string :type
      t.string :attendees
      t.string :organizer
      t.string :web_link

      t.timestamps
    end
  end
end
