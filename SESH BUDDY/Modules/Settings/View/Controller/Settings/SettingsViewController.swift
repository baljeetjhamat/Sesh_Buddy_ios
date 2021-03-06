//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit
enum SettingsSection: Int {
    case notifications
    case sendFeedBack
    case termsOfUse
    case privacyNotice
    case count
}
class SettingsViewController:UIViewController {

    @IBOutlet weak var settingsTableView: UITableView!
    var presenter: SettingsPresenterProtocol?
    let labelTableViewCell = "LabelTableViewCell"
	override func viewDidLoad() {
        super.viewDidLoad()
        self.changeStyle(.default)
        self.showMenuBarButton(true)
        self.setNavBarTitleView(image: ThemeImages.appLogo)
        self.setUPUI() 
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.setNavBarTitleView(image: ThemeImages.appLogo)
        self.changeNavBarColor(.themeNavBarColor)
        
    }
    
    func setUPUI() {
        self.settingsTableView.backgroundColor = UIColor.greyBackgroundColor
        self.settingsTableView.registerCellFrom(labelTableViewCell)
        self.settingsTableView.dataSource = self
        self.settingsTableView.delegate = self
    }
    
}
extension SettingsViewController: SettingsViewProtocol {
    func onError(value: String) {
        
    }
    func showAlert(_ string: String) {
        
    }
}
extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let enumVal = SettingsSection.init(rawValue: indexPath.section) else {
            return 
        }
        
        switch enumVal {
        case .notifications:
            self.presenter?.didTapAtNotifications()
        case .sendFeedBack:
            break
        case .termsOfUse:
            break
        case .privacyNotice:
            break
        default:
            break
        }
    }
}
extension  SettingsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return SettingsSection.count.rawValue
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: labelTableViewCell) as? LabelTableViewCell else {
            return UITableViewCell()
        }
        
        guard let enumVal = SettingsSection.init(rawValue: indexPath.section) else {
            return UITableViewCell()
        }
        switch enumVal {
        case .notifications:
            cell.descLabel.text = "Notifications"
        case .sendFeedBack:
            cell.descLabel.text = "Send Feedback"
        case .termsOfUse:
            cell.descLabel.text = "Terms of Use"
        case .privacyNotice:
            cell.descLabel.text = "Privacy Notice"
        default:
            break
        }
        cell.hideToogleButton(value: true)
        return cell
    }
    
    
}
