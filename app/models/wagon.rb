class Wagon < ApplicationRecord
  belongs_to :train
  belongs_to :wagon_type
end
