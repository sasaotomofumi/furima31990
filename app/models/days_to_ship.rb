class DaysToShip < ActiveHash::Base
  self.data = [
    { id: 1, name: '__' },
    { id: 2, name: '1-2で配送'},
    { id: 3, name: '2-3で配送'},
    { id: 4, name: '4-7で配送'},
 ]
    include ActiveHash::Associations
    has_many :product
end