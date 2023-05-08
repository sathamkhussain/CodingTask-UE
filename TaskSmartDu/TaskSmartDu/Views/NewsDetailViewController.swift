//
//  NewsDetailViewController.swift
//  TaskSmartDu
//
//  Created by Satham Hussain on 08/05/2023.
//

import Foundation
import UIKit
import SDWebImage

class NewsDetailViewController: UIViewController {
    @IBOutlet weak var newsImgView: UIImageView!
    @IBOutlet weak var authorLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descTxtView: UITextView!
    @IBOutlet weak var readArticleBtn: UIButton!
    var model: NewsData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupview()
    }
    
    func setupview() {
        newsImgView.sd_setImage(with: URL(string: model?.media?.first?.mediametadata?.last?.url ?? ""))
        authorLbl.text = model?.byline ?? ""
        titleLbl.text = model?.title ?? ""
        descTxtView.text = model?.abstract ?? ""
     }
    

    @IBAction func readArticleAction() {
       debugPrint("Article tapped")
        if let url = URL(string: model?.url ?? "") {
            UIApplication.shared.open(url)
        }
    }
  
}
