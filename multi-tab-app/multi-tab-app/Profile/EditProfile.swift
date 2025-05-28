//
//  EditProfile.swift
//  multi-tab-app
//
//  Created by Lena Hunanian on 27.05.25.
//
import UIKit

class EditProfileViewController: UIViewController {
    let someLabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        title = "Edit Profile"
        
        setupUI()
        setupConstraints()
        
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
    
    
    
    
    
    private func setupUI() {
        someLabel.text = "You're in EditProfile View Controller"
        view.addSubview(someLabel)
        someLabel.translatesAutoresizingMaskIntoConstraints = false
        someLabel.textAlignment = .center
        someLabel.numberOfLines = 4
        someLabel.font = .systemFont(ofSize: 40, weight: .bold)
        someLabel.clipsToBounds = false
    }
    
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            someLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
            someLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            someLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            
        ])
    }
}
#Preview {
    EditProfileViewController()
}
