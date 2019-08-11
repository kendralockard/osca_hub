class Coop < ApplicationRecord
  has_many :users, dependent: :nullify
  has_many :announcements, through: :users
  has_many :menus, through: :users
  has_many :events, through: :users
  has_many :discussions, through: :users

  def self.coops
    ["", "Brown Bag", "Fairkid", "Hark", "Keep", "Pyle", "Tank", "TWC"]
  end

  def self.fsc
    ["",
      "Brown Bag FSC",
      "Fairkid FSC",
      "Hark FSC",
      "Keep FSC",
      "Pyle FSC",
      "Tank FSC",
      "TWC FSC"
    ]
  end

  def self.new_member_trainer
    ["",
      "Brown Bag New Member Trainer",
      "Fairkid New Member Trainer",
      "Hark New Member Trainer",
      "Keep New Member Trainer",
      "Pyle New Member Trainer",
      "Tank New Member Trainer",
      "TWC New Member Trainer"
    ]
  end

  def self.memco
    ["",
      "Brown Bag MemCo",
      "Fairkid MemCo",
      "Hark MemCo",
      "Keep MemCo",
      "Pyle MemCo",
      "Tank MemCo",
      "TWC MemCo"
    ]
  end

  def self.accessco
    ["",
      "Brown Bag AccessCo",
      "Fairkid AccessCo",
      "Hark AccessCo",
      "Keep AccessCo",
      "Pyle AccessCo",
      "Tank AccessCo",
      "TWC AccessCo"
    ]
  end

  def self.nutco
    ["",
      "Brown Bag NutCo",
      "Fairkid NutCo",
      "Hark NutCo",
      "Keep NutCo",
      "Pyle NutCo",
      "Tank NutCo",
      "TWC NutCo"
    ]
  end

  def self.kitcho
    ["",
      "Brown Bag KitchCo",
      "Fairkid KitchCo",
      "Hark KitchCo",
      "Keep KitchCo",
      "Pyle KitchCo",
      "Tank KitchCo",
      "TWC KitchCo"
    ]
  end

  def self.dlecs
    ["",
      "Brown Bag DLECs",
      "Fairkid DLECs",
      "Hark DLECs",
      "Keep DLECs",
      "Pyle DLECs",
      "Tank DLECs",
      "TWC DLECs"
    ]
  end

  def self.treasurer
    ["",
      "Brown Bag Treasurer",
      "Fairkid Treasurer",
      "Hark Treasurer",
      "Keep Treasurer",
      "Pyle Treasurer",
      "Tank Treasurer",
      "TWC Treasurer"
    ]
  end

  def self.board_rep
    ["",
      "Brown Bag Board Rep",
      "Fairkid Board Rep",
      "Hark Board Rep",
      "Keep Board Rep",
      "Pyle Board Rep",
      "Tank Board Rep",
      "TWC Board Rep"
    ]
  end

  def self.food_unpacker_recycler
    ["",
      "Brown Bag Food Unpacker/Recycler",
      "Fairkid Food Unpacker/Recycler",
      "Hark Food Unpacker/Recycler",
      "Keep Food Unpacker/Recycler",
      "Pyle Food Unpacker/Recycler",
      "Tank Food Unpacker/Recycler",
      "TWC Food Unpacker/Recycler"
    ]
  end

end
