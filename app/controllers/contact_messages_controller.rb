class ContactMessagesController < ApplicationController

  def email

    @name = params[:name]
    @email = params[:email]
    @message = params[:message]

    if @name.blank?
      flash.now[:alert] = "Please enter your name before sending your message. Thank you."
      render 'pages/contact'
    elsif @email.blank? || @email.scan(/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i).size < 1
      flash.now[:alert] = "You must provide a valid email address before sending your message. Thank you."
      render 'pages/contact'
    elsif @message.blank? || @message.length < 10
      flash.now[:alert] = "Your message is empty. Requires at least 10 characters. Nothing to send."
      render 'pages/contact'
    elsif @message.scan(/<a href=/).size > 0 || @message.scan(/\[url=/).size > 0 || @message.scan(/\[link=/).size > 0 || @message.scan(/http:\/\//).size > 0
      flash.now[:alert] = "You can't send links. Thank you for your understanding."
      render 'pages/contact'
    else
      ContactMessage.create(name: @name, email: @email, message: @message)
      ContactMailer.contact_message(@name,@email,@message).deliver_now
      redirect_to root_path, notice: "Your message was sent. Thank you."
    end
  end

end