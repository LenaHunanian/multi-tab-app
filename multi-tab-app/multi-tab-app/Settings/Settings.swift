//
//  Settings.swift
//  multi-tab-app
//
//  Created by Lena Hunanian on 27.05.25.
//
import UIKit

class SettingsViewController: UIViewController {
    
    let label = UILabel()
    let toggle = UISwitch()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setupUI()
        setupConstraints()
        toggleAction()
        
        
        
        
    }
    
    private func setupUI() {
        label.text = ""
        label.font = .systemFont(ofSize: 25)
        
        view.addSubview(label)
        view.addSubview(toggle)
        toggle.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        toggle.isOn = false
    }
    
    
    
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            toggle.topAnchor.constraint(equalTo: label.topAnchor),
            toggle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
    
    private func toggleAction() {
        toggle.addTarget(self, action: #selector(toggleSwitched(_:)), for: .valueChanged)
    }
    
    
    @objc private func toggleSwitched(_ sender: UISwitch) {
        if sender.isOn {
            label.text = "Navigation is easy!"
        }else {
            label.text = ""
        }
    }
}

#Preview {
    SettingsViewController()
}
