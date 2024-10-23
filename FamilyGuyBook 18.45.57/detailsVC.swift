//
//  detailsVC.swift
//  FamilyGuyBook
//
//  Created by Habil Demirci on 29.09.2024.
//

import UIKit

class detailsVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    var selectedfamilyGuy : familyGuy?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = selectedfamilyGuy?.name
        commentLabel.text = selectedfamilyGuy?.comment
        imageView.image = selectedfamilyGuy?.image
        // Do any additional setup after loading the view.
    }
    

    
}
