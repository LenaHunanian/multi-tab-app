//
//  Preferences.swift
//  multi-tab-app
//
//  Created by Lena Hunanian on 27.05.25.
//
import UIKit

class PreferencesViewController: UIViewController {
    
    var name: String?
    var phone: String?
    var selectedPreference: String?
    
    
    
    let selectPreferenceButton = UIButton(type: .system)
    let selectedPreferenceLabel = UILabel()
    let continueButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
    }
    
    private func setupUI() {
        //  button
        selectPreferenceButton.setTitle("Select Notification Preference", for: .normal)
        selectPreferenceButton.titleLabel?.font = .systemFont(ofSize: 20)
        selectPreferenceButton.addTarget(self, action: #selector(showPreferenceActionSheet), for: .touchUpInside)
        
        // label
        selectedPreferenceLabel.text = "No preference selected"
        selectedPreferenceLabel.font = .systemFont(ofSize: 16)
        selectedPreferenceLabel.textColor = .secondaryLabel
        selectedPreferenceLabel.textAlignment = .center
        selectedPreferenceLabel.numberOfLines = 0
        
        //continue button
        continueButton.titleLabel?.font = .systemFont(ofSize: 25)
        continueButton.setTitle("Continue", for: .normal)
        continueButton.setTitleColor(.white, for: .normal)
        continueButton.backgroundColor = .systemBlue
        continueButton.layer.cornerRadius = 10
        
        continueButton.addTarget(self, action: #selector(continueAction), for: .touchUpInside)
        
        
        
        view.addSubview(selectPreferenceButton)
        view.addSubview(selectedPreferenceLabel)
        view.addSubview(continueButton)
        
        // Layout
        selectPreferenceButton.translatesAutoresizingMaskIntoConstraints = false
        selectedPreferenceLabel.translatesAutoresizingMaskIntoConstraints = false
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            selectPreferenceButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
            selectPreferenceButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),

    
            selectedPreferenceLabel.topAnchor.constraint(equalTo: selectPreferenceButton.bottomAnchor, constant: 20),
            selectedPreferenceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            continueButton.topAnchor.constraint(equalTo: selectedPreferenceLabel.bottomAnchor, constant: 40),
            continueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            continueButton.widthAnchor.constraint(equalToConstant: 150),
        ])
    }
    
    @objc private func showPreferenceActionSheet() {
        
        let actionSheet = UIAlertController(
            title: "Select Notification Preference",
            message: nil,
            preferredStyle: .actionSheet
        )
        
        // Email notification
        let emailAction = UIAlertAction(title: "Email Notifications", style: .default) { _ in
            self.updatePreferenceLabel(with: "Email Notifications")
        }
        
        // SMS notification
        let smsAction = UIAlertAction(title: "SMS Notifications", style: .default) { _ in
            self.updatePreferenceLabel(with: "SMS Notifications")
        }
        
        // Push notification
        let pushAction = UIAlertAction(title: "Push Notifications", style: .default) { _ in
            self.updatePreferenceLabel(with: "Push Notifications")
        }
        
        // Cancel option
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        // Add actions
        actionSheet.addAction(emailAction)
        actionSheet.addAction(smsAction)
        actionSheet.addAction(pushAction)
        actionSheet.addAction(cancelAction)
        
        present(actionSheet, animated: true)
    }
    
    private func updatePreferenceLabel(with preference: String) {
        selectedPreference = preference  
        selectedPreferenceLabel.text = "Selected: \(preference)"
        selectedPreferenceLabel.textColor = .label
    }
    
  @objc  private func continueAction(_ sender: UIButton){
      let confirmVC = ConfirmDetailsViewController()
          confirmVC.name = name
          confirmVC.phone = phone
          confirmVC.notificationPreference = selectedPreference
          navigationController?.pushViewController(confirmVC, animated: true)
        
    }
}
#Preview {
    PreferencesViewController()
}
