//
//  HomeViewController.swift
//  Moltaqa_Task
//
//  Created by Oday Dieg on 25/10/2022.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var headerContainerView: UIView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var profileContainerView: UIView!
    @IBOutlet weak var secondProfileContainerView: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var bodyContainerView: UIView!
    @IBOutlet weak var calendarContainerView: UIView!
    @IBOutlet weak var mainTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHeaderView()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {

    }
    
    private func setupHeaderView(){
        
        profileContainerView.layer.cornerRadius              = profileContainerView.frame.width / 2
        profileImage.layer.cornerRadius                      = profileImage.frame.width / 2
        secondProfileContainerView.layer.cornerRadius        = profileImage.frame.width / 2
        
        headerContainerView.layer.cornerRadius = 8
        headerContainerView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        calendarContainerView.layer.cornerRadius = 20
        
    }
    
    private func setupTableView(){
        mainTableView.delegate      = self
        mainTableView.dataSource    = self
        mainTableView.register(UINib(nibName: Cell.HomeTableViewCell, bundle: nil), forCellReuseIdentifier: Cell.HomeTableViewCell)
    }

    @IBAction func editStatusBtnPressed(_ sender: Any) {
        guard let vc = UIStoryboard.init(name: StoryBoard.HomeStoryBoard, bundle: nil).instantiateViewController(withIdentifier: ViewControllers.changeStatusViewController) as? changeStatusViewController else {return}
            vc.modalPresentationStyle = .overFullScreen
            vc.delegate = self
            self.present(vc, animated: false)
    }
    

}


extension HomeViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.HomeTableViewCell, for: indexPath) as? HomeTableViewCell else {
            return UITableViewCell()
        }
        
        if indexPath.row == 0 {
            cell.locationConatinerView.isHidden         = true
            cell.qrCodeContainerView.isHidden           = true
            cell.InArrangeContainerView.isHidden        = true
        }else if indexPath.row == 1 {
            cell.onlineCheckInContainerView.isHidden    = true
            cell.qrCodeContainerView.isHidden           = true
        }else{
            cell.checkInBtn.alpha                       = 0.5
            cell.locationConatinerView.isHidden         = true
            cell.onlineCheckInContainerView.isHidden    = true
            cell.checkOutContainerView.isHidden         = true
        }
        cell.selectionStyle = .none

        return cell
    }
}



extension HomeViewController:changeStatusDelegate {
    func UserStatus(is status: String) {
        self.statusLabel.text = status
    }
}
