class Shipcharge < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '' },
  ]
  end
  
  include ActiveHash::Associations
  has_many :items

end