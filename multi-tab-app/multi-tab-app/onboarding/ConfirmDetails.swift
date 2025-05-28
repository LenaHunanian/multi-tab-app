//
//  ConfirmDetails.swift
//  multi-tab-app
//
//  Created by Lena Hunanian on 27.05.25.
//
import UIKit

extension UINavigationController {
    func popToViewController<T: UIViewController>(ofType type: T.Type, animated: Bool = true) {
        if let vc = viewControllers.first(where: { $0 is T }) {
            popToViewController(vc, animated: animated)
        }
    }
}




class ConfirmDetailsViewController: UIViewController {
    var name: String?
    var phone: String?
    var notificationPreference: String?
    
    var nameLabel = UILabel()
    var phoneLabel = UILabel()
    var notLabel = UILabel()
    
    
    var startOverButton = UIButton()
    var editButton = UIButton()
    var editPersonalInfoButton = UIButton()
    var confirmButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
        setupConstraints()
        navigationItem.hidesBackButton = true
        
    }
    
    
    private func setupUI() {
        nameLabel.text = ("Name: \(name ?? "")" )
        phoneLabel.text = "Phone number: \(phone ?? "")"
        notLabel.text = "Notification Preference:\(notificationPreference ?? "")"
        
        nameLabel.font = .systemFont(ofSize: 20)
        phoneLabel.font = .systemFont(ofSize: 20)
        notLabel.font = .systemFont(ofSize: 20)
        
        startOverButton.titleLabel?.font = .systemFont(ofSize: 20)
        startOverButton.setTitle("Start Over", for: .normal)
        startOverButton.setTitleColor(.white, for: .normal)
        startOverButton.backgroundColor = .systemBlue
        startOverButton.layer.cornerRadius = 10
        startOverButton.addTarget(self, action: #selector(startOverButtonTapped), for: .touchUpInside)
        
        
        editButton.titleLabel?.font = .systemFont(ofSize: 20)
        editButton.setTitle( "Edit Preferences", for: .normal)
        editButton.setTitleColor(.white, for: .normal)
        editButton.backgroundColor = .systemBlue
        editButton.layer.cornerRadius = 10
        editButton.addTarget(self, action: #selector(editPreferencesButtonTapped), for: .touchUpInside)
        
        
        editPersonalInfoButton.titleLabel?.font = .systemFont(ofSize: 20)
        editPersonalInfoButton.setTitle("Edit Personal Info", for: .normal)
        editPersonalInfoButton.setTitleColor(.white, for: .normal)
        editPersonalInfoButton.backgroundColor = .systemBlue
        editPersonalInfoButton.layer.cornerRadius = 10
        editPersonalInfoButton.addTarget(self, action: #selector(editPersonalInfoButtonTapped), for: .touchUpInside)
        
        
        confirmButton.titleLabel?.font = .systemFont(ofSize: 20)
        confirmButton.setTitle( "Confirm", for: .normal)
        confirmButton.setTitleColor(.white, for: .normal)
        confirmButton.backgroundColor = .systemBlue
        confirmButton.layer.cornerRadius = 10
        confirmButton.addTarget(self, action: #selector(confirmButtonTapped), for: .touchUpInside)
        
        view.addSubview(nameLabel)
        view.addSubview(phoneLabel)
        view.addSubview(notLabel)
        view.addSubview(startOverButton)
        view.addSubview(editButton)
        view.addSubview(editPersonalInfoButton)
        view.addSubview(confirmButton)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        notLabel.translatesAutoresizingMaskIntoConstraints = false
        startOverButton.translatesAutoresizingMaskIntoConstraints = false
        editButton.translatesAutoresizingMaskIntoConstraints = false
        editPersonalInfoButton.translatesAutoresizingMaskIntoConstraints = false
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            //labels
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            phoneLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            phoneLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            notLabel.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 20),
            notLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            //buttons
            startOverButton.topAnchor.constraint(equalTo: notLabel.bottomAnchor, constant: 150),
            startOverButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startOverButton.widthAnchor.constraint(equalToConstant: 200),
            startOverButton.heightAnchor.constraint(equalToConstant: 50),
            
            editButton.topAnchor.constraint(equalTo: startOverButton.bottomAnchor, constant: 20),
            editButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            editButton.widthAnchor.constraint(equalToConstant: 200),
            editButton.heightAnchor.constraint(equalToConstant: 50),
            
            editPersonalInfoButton.topAnchor.constraint(equalTo: editButton.bottomAnchor, constant: 20),
            editPersonalInfoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            editPersonalInfoButton.widthAnchor.constraint(equalToConstant: 200),
            editPersonalInfoButton.heightAnchor.constraint(equalToConstant: 50),
            
            confirmButton.topAnchor.constraint(equalTo: editPersonalInfoButton.bottomAnchor, constant: 20),
            confirmButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            confirmButton.widthAnchor.constraint(equalToConstant: 200),
            confirmButton.heightAnchor.constraint(equalToConstant: 50)
            
            
            
        ])
    }
    //MARK: actions for buttons
    
    @objc func startOverButtonTapped(_ sender: UIButton) {
        navigationController?.popToViewController(ofType: OnboardingViewController.self)
        
    }
    @objc func editPreferencesButtonTapped(_ sender: UIButton) {
        navigationController?.popToViewController(ofType: PreferencesViewController.self)
        
    }
    @objc func editPersonalInfoButtonTapped(_ sender: UIButton) {
        navigationController?.popToViewController(ofType: PersonalInfoViewController.self)
    }
    @objc func confirmButtonTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: "Success", message: "Your information has been confirmed!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
            if let navController = self.navigationController {
                if let onboardingVC = navController.viewControllers.first(where: { $0 is OnboardingViewController }) as? OnboardingViewController {
                    onboardingVC.isRestart = true
                }
                navController.popToRootViewController(animated: true)
            }
        })
        
        present(alert, animated: true)
    }
    
    
    
    
    
    
    
}

#Preview {
    ConfirmDetailsViewController()
}
