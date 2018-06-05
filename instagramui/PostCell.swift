//
//  PostCell.swift
//  InstagramUI
//
//  Created by Duc Tran on 3/25/17.
//  Copyright © 2017 Developers Academy. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var numberOfLikesButton: UIButton!
    @IBOutlet weak var timeAgoLabel: UILabel!
    @IBOutlet weak var postCaptionLabel: UILabel!
    
    var post: Post! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI()
    {
        self.postImageView.image = post.image
        postCaptionLabel.text = post.caption
        numberOfLikesButton.setTitle("Be the first one to share a comment", for: [])
        timeAgoLabel.text = post.timeAgo
    }
}




















