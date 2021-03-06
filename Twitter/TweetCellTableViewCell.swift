//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Berk Burak Tasdemir on 2/22/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetContentLabel: UILabel!
    @IBOutlet weak var rtButton: UIButton!
    @IBOutlet weak var favButton: UIButton!
    
    var favorited: Bool = false {
        didSet {
            self.favButton.setImage(UIImage(named: self.favorited ? "favor-icon-red" : "favor-icon"), for: .normal)
        }
    }
    
    var retweeted: Bool = false {
        didSet {
            self.rtButton.setImage(UIImage(named: self.retweeted ? "retweet-icon-green" : "retweet-icon"), for: .normal)
            self.rtButton.isEnabled = !self.retweeted
        }
    }
    
    var tweetId: Int = -1
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func favoriteTweet(_ sender: Any) {
        TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, favorited: !self.favorited, success: {
            self.favorited = !self.favorited
        }, failure: { (error) in
            print(error)
        })
    }
    
    @IBAction func retweet(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {
            self.retweeted = !self.retweeted
        }, failure: { (error) in
            print(error)
        })
    }
    
}
