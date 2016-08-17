module StaticPagesHelper
  def next_intake_date
    intake = Intake.last
    if intake
      intake_date = intake.start_date 
      if intake_date.future?
        intake_date.strftime("on %A, %b %d")
      else
        "in December"
      end
    end
  end
end
