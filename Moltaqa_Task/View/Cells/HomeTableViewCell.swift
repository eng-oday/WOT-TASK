//
//  HomeTableViewCell.swift
//  Moltaqa_Task
//
//  Created by Oday Dieg on 25/10/2022.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var onlineCheckInContainerView: UIView!
    @IBOutlet weak var locationConatinerView: UIView!
    @IBOutlet weak var qrCodeContainerView: UIView!
    
    @IBOutlet weak var checkOutContainerView: UIView!
    @IBOutlet weak var InArrangeContainerView: UIView!
    
    @IBOutlet weak var checkInBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
        
    }

    
    private func setupCell(){
        containerView.layer.cornerRadius    = 20
        checkInBtn.layer.cornerRadius       = 8
    }
    
    @IBAction func checkInBtnPressed(_ sender: Any) {
    }
}
