class MeetingMailer < ApplicationMailer

  def creation_confirmation(meeting)
    @meeting = meeting

    mail(
      to:       @meeting.user.email,
      subject:  "Meeting #{@meeting.name} created!"
    )
  end
end
