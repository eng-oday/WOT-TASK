//
//  MoreViewController.swift
//  Moltaqa_Task
//
//  Created by Oday Dieg on 25/10/2022.
//

import UIKit

class MoreViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    

    @IBOutlet weak var settingTableView: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView(){
        settingTableView.delegate   = self
        settingTableView.dataSource = self
        settingTableView.register(UINib(nibName: Cell.SettingsTableViewCell, bundle: nil), forCellReuseIdentifier: Cell.SettingsTableViewCell)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return staticData.SettingModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.SettingsTableViewCell, for: indexPath) as? SettingsTableViewCell else {return UITableViewCell()}
        let data = staticData.SettingModel[indexPath.row]
        cell.cellImage.image    = data.image
        cell.cellLabel.text     = data.text
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if indexPath.row == 0 {
            guard let vc = UIStoryboard.init(name: StoryBoard.More, bundle: nil).instantiateViewController(withIdentifier: ViewControllers.ProfileViewController) as? ProfileViewController else {return}
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }

    


}
