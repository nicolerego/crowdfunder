class PledgeController < ApplicationController
  def show
  end

  def create


    @project.send_emails_if_necessary
  end
end
