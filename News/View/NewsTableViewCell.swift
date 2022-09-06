//
//  NewsTableViewCell.swift
//  News
//
//  Created by Deepak Kumar Dash on 27/08/22.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var titleHeading: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var dataLbl: UILabel!
    @IBOutlet weak var sourceLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    /// Variable to set the value to cell and its outlet
    var news: Feed? {
        didSet {
            self.titleHeading.text = news?.title ?? ""
            self.subTitle.text = news?.byline ?? ""
            self.dataLbl.text = news?.updated ?? ""
            self.sourceLbl.text = news?.source ?? ""
            guard let url = news?.media.first?.mediametadata?.first?.url else { return}
            self.profileImage.loadImageUsingCache(withUrl: url)
        }
    }
}
