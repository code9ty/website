class StaticPagesController < ApplicationController
  def home
    @applicant = Applicant.new
    @open = Intake.open?
  end
  def what
    set_meta_tags og: {
      image:'https://s3-us-west-2.amazonaws.com/code9ty/edt.jpg',
      url: learn_to_code_url,
      type: 'website'
    }
  end
end
