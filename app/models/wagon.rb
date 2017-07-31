class Wagon < ApplicationRecord
  belongs_to :train
  belongs_to :wagon_type

  # NOTE: не повредит добавление валидаций
end
