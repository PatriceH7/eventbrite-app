class Attendance < ApplicationRecord
	belongs_to :event, optional: true
	belongs_to :user, optional: true

	after_create :new_event_send

	def new_event_send
		AttendanceMailer.new_event_email(self).deliver_now
	end

end
