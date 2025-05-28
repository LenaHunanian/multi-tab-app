//
//  Onboarding.swift
//  multi-tab-app
//
//  Created by Lena Hunanian on 27.05.25.
//
import UIKit

class OnboardingViewController: UIViewController {
    let welcomeLabel = UILabel()
    let startButton = UIButton()
    var isRestart = false

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
        setupConstraints()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if isRestart {
            startButton.setTitle("Restart", for: .normal)
            startButton.backgroundColor = .systemGreen
        }
    }

    
    
    private func setupUI() {
        welcomeLabel.text = "Welcome to Multi Tab App!"
        welcomeLabel.font = .systemFont(ofSize: 24)
        welcomeLabel.textColor = .black
        view.addSubview(welcomeLabel)
        
        startButton.titleLabel?.font = .systemFont(ofSize: 30)
        startButton.setTitle("Start", for: .normal)
        startButton.setTitleColor(.white, for: .normal)
        startButton.backgroundColor = .systemBlue
        startButton.layer.cornerRadius = 10
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        view.addSubview(startButton)
        
    }
    
    private func setupConstraints() {
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        startButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -60),
            
            startButton.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 30),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.widthAnchor.constraint(equalToConstant: 150)
            
        ])
        
    }
    
    @objc func startButtonTapped() {
        let personalInfoVC = PersonalInfoViewController()
        navigationController?.pushViewController(personalInfoVC, animated: true)
    }
}

#Preview{
    OnboardingViewController()
}
