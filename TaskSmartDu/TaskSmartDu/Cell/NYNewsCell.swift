//
//  NYNewsCell.swift
//  TaskSmartDu
//
//  Created by Satham Hussain on 08/05/2023.
//

import UIKit
import SDWebImage

class NYNewsCell: UITableViewCell {
    @IBOutlet weak var thumbnailImgView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    var model: NewsData?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setupView() {
        self.selectionStyle = .none
        titleLbl.numberOfLines = 2
        titleLbl.font = UIFont.boldSystemFont(ofSize: 16)
        descLbl.numberOfLines = 2
        descLbl.textColor = UIColor.secondaryLabel
        descLbl.font = UIFont.systemFont(ofSize: 15)
        dateLbl.textColor = UIColor.secondaryLabel
        dateLbl.font = UIFont.systemFont(ofSize: 15)
        thumbnailImgView.layer.cornerRadius = thumbnailImgView.frame.size.height/2
    }

    
    func configure(model: NewsData?) {
        titleLbl.text = model?.title ?? ""
        descLbl.text = model?.abstract ?? ""
        thumbnailImgView.sd_setImage(with: URL(string:model?.media?.first?.mediametadata?.first?.url ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
        dateLbl.text = model?.published_date ?? ""
    }
}
