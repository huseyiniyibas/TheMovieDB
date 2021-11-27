//
//  MovieTableCell.swift
//  TheMovieDB
//
//  Created by Hüseyin İyibaş on 27.11.2021.
//

import UIKit

class MovieTableCell: UITableViewCell {
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieRatingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(with movie: MovieDetail) {
        movieNameLabel.text = movie.originalTitle
        if let voteAverage = movie.voteAverage {
            movieRatingLabel.text = "\(voteAverage)"
        }
    }
}
