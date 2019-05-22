//
//  SoccerPlayerCell.swift
//  3x3ConnectAssignment
//
//  Created by Saikat on 21/05/19.
//  Copyright © 2019 Saikat. All rights reserved.
//


import UIKit

class SoccerPlayerCell: UICollectionViewCell {
  
  @IBOutlet fileprivate weak var containerView: UIView!
  @IBOutlet  weak var imageView: UIImageView!
  @IBOutlet fileprivate weak var captionLabel: UILabel!
  @IBOutlet fileprivate weak var commentLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    containerView.layer.cornerRadius = 6
    containerView.layer.masksToBounds = true
  }
  
  var player: Player? {
    didSet {
      if let player = player {
        imageView.loadImageUsingCache(withUrl: player.imageURL)
        captionLabel.text = player.caption
        commentLabel.text = player.comment
      }
    }
  }
  
}
