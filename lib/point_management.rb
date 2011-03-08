module PointManagement
  def give_point!(giver)
    self.points += 1
    self.save
    point = PointTransaction.new
    point.amount = 1
    point.receiver = self
    point.giver = giver
    point.save
  end
end
