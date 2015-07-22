module ApplicationHelper

  def bootstrap_class_for flash_type
      { success: "notification-success", error: "notification-danger", alert: "notification-warning", notice: "notification-info" }[flash_type.parameterize.underscore.to_sym] || flash_type.to_s
  end

  def flash_messages(opts = {})
    a = ""
    flash.each do |msg_type, message|
      a += "<div class='alert alert-dismissible notification #{bootstrap_class_for(msg_type)} fade in'>
        <button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true' style='margin-right:20px'>&times;</span></button>
        <strong>#{message}
      </div>"
    end
    a.html_safe
  end

end
