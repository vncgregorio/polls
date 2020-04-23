class VoteService
  include ActiveModel::Validations

  attr_accessor :poll
  attr_accessor :option
  attr_accessor :number

  def initialize(params = {})
    @poll = params[:poll] || nil
    @number = params[:number] || nil
    @option = findOption()
  end

  def save
    return self.option.present? ? Vote.create(:option => self.option) : false
  end

  private

    def findOption()
      opt = nil

      if self.poll.present? && self.number.present?

        resultset = Option.where(
          :poll => self.poll,
          :number => self.number
        )

        unless resultset.empty?
          opt = resultset.first
        end

      end

      if opt.nil?
        self.errors.add(:option, "option not found")
      end

      return opt
    end

end
