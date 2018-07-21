//
//  EpisodeCellTableViewCell.swift
//  PodcastCourseLBTA
//
//  Created by Dewayne Perry on 7/3/18.
//  Copyright © 2018 The United States of America. All rights reserved.
//

import UIKit

class EpisodeCellTableViewCell: UITableViewCell {
    
    var episode: Episode! {
        didSet {
            titleLabel.text = episode.title
            descriptionLabel.text = episode.description
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM dd, yyyy"
            dateLabel.text = dateFormatter.string(from: episode.pubDate)
            let url = URL(string: episode.imageUrl?.toSecureHTTPS() ?? "")
            episodeImageView.sd_setImage(with: url, completed: nil)
        }
    }

    @IBOutlet weak var episodeImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.numberOfLines = 2
        }
    }
    @IBOutlet weak var descriptionLabel: UILabel!  {
        didSet {
            descriptionLabel.numberOfLines = 2
        }
    }
    
}
