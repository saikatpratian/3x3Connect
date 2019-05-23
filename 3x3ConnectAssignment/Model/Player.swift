//
//  Player.swift
//  3x3ConnectAssignment
//
//  Created by Saikat on 21/05/19.
//  Copyright © 2019 Saikat. All rights reserved.
//


import UIKit

struct Player: Decodable {
  
  var caption: String
  var comment: String
  var imageURL: String
  
  
  init(caption: String, comment: String, imageURL: String) {
    self.caption = caption
    self.comment = comment
    self.imageURL = imageURL
  }
  
}
