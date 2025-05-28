//
//  Profile.swift
//  multi-tab-app
//
//  Created by Lena Hunanian on 27.05.25.
//

import UIKit

class ProfileViewController: UIViewController {
    let label = UILabel()
    let editButton = UIButton()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Profile"
        
        
        
        setupUI()
        setupConstraints()
        setupNavigationItems()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear called")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear called")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print(" viewWillLayoutSubviews called")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("viewDidLayoutSubviews called")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear called")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear called")
    }
    
    
    private func setupNavigationItems() {
        let editNameItem = UIBarButtonItem(
            image: UIImage(systemName: "pencil.slash"),
            style: .plain,
            target: self,
            action: #selector(promptForName)
        )
        
        let anonymousItem = UIBarButtonItem(
            image: UIImage(systemName: "person.crop.circle.fill"),
            style: .plain,
            target: self,
            action: #selector(setAnonymousName)
        )
        
        navigationItem.rightBarButtonItems = [editNameItem, anonymousItem]
    }
    
    
    
    private func setupUI() {
        label.text = "USERNAME"
        label.font = .systemFont(ofSize: 30)
        
        editButton.setTitle("Edit profile", for: .normal)
        editButton.setTitleColor(.white, for: .normal)
        editButton.backgroundColor = .systemBlue
        editButton.titleLabel?.font = .systemFont(ofSize: 25)
        editButton.layer.cornerRadius = 10
        editButton.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
        
        view.addSubview(label)
        view.addSubview(editButton)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        editButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 250),
            
            editButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 50),
            editButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            editButton.widthAnchor.constraint(equalToConstant: 150),
            
            
        ])
    }
    
    // action for button "Edit profile"
    @objc private func editButtonTapped(_ sender: UIButton) {
        let editVC = EditProfileViewController()
        navigationController?.pushViewController(editVC, animated: true)
    }
    
    //actions for navigation items
    @objc private func promptForName() {
        let alert = UIAlertController(title: "Edit Name", message: "Enter a new name", preferredStyle: .alert)
        alert.addTextField()
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            let input = alert.textFields?.first?.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            self.label.text = input?.isEmpty == false ? input : "Default"
        }))
        present(alert, animated: true)
    }
    
    @objc private func setAnonymousName() {
        label.text = "Anonymous"
    }
    
}

#Preview{
    ProfileViewController()
}
