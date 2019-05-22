
//
//  SoccerPlayerViewController.swift
//  3x3ConnectAssignment
//
//  Created by Saikat on 21/05/19.
//  Copyright © 2019 Saikat. All rights reserved.
//


import UIKit
import AVFoundation
import FirebaseDatabase

class SoccerPlayerViewController: UICollectionViewController {
    
    var players = [Player]()
    var ref: DatabaseReference!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         Fetching the data from the Realtime firebase database
         Syncing is working fine , if we make any changes in the firebase JSON,
         
         Instantly CollectionView data is also getiing refreshed
         */
        
        ref = Database.database().reference()
        
        _ = ref.observe(DataEventType.value, with: { (snapshot) in
            if snapshot.childrenCount>0{
                self.players.removeAll()
                
                for snapshots in snapshot.children.allObjects as! [DataSnapshot]{
                    let photoDict = snapshots.value as! [String: String]
                    let player = Player(caption: photoDict["caption"]!, comment: photoDict["comment"]!, imageURL: photoDict["imageURL"]!)
                    self.players.append(player)
                    self.collectionView.reloadData()
                }
            }
        })
        
        //configuring the UI
        view.backgroundColor = UIColor.lightGray
        collectionView?.backgroundColor = .clear
        collectionView?.contentInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
    
}

extension SoccerPlayerViewController: UICollectionViewDelegateFlowLayout {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return players.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SoccerPlayerCell", for: indexPath as IndexPath) as! SoccerPlayerCell
        cell.player = players[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right + 10)) / 2
        return CGSize(width: itemSize, height: itemSize)
    }
    
}


