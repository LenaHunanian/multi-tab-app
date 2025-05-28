//
//  PersonalInfo.swift
//  multi-tab-app
//
//  Created by Lena Hunanian on 27.05.25.
//
import UIKit



class PersonalInfoViewController: UIViewController {
    
    let nameLabel = UILabel()
    let nameTextField = UITextField()
    let warningLabel = UILabel()
    let phoneLabel = UILabel()
    let phoneTextField = UITextField()
    let confirmButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
        setupConstraints()
    }
    
    //setting up UI elements
    private func setupUI() {
        nameLabel.text = "Enter your name"
        nameLabel.font = .systemFont(ofSize: 25)
        nameTextField.placeholder = "exapmple: John Appleseed"
        nameTextField.borderStyle = .roundedRect
        nameTextField.textAlignment = .center
        phoneLabel.text = "Enter your phone number"
        warningLabel.text = "(at least 9 digits)"
        phoneLabel.font = .systemFont(ofSize: 25)
        phoneTextField.placeholder = "0110770999"
        phoneTextField.textAlignment = .center
        phoneTextField.borderStyle = .roundedRect
        confirmButton.setTitle("Confirm", for: .normal)
        confirmButton.titleLabel?.font = .systemFont(ofSize: 25)
        confirmButton.backgroundColor = .systemBlue
        confirmButton.layer.cornerRadius = 10
        warningLabel.font = .systemFont(ofSize: 15)
        confirmButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        nameTextField.addTarget(self, action: #selector(textFieldsChanged), for: .editingChanged)
        phoneTextField.addTarget(self, action: #selector(textFieldsChanged), for: .editingChanged)
        confirmButton.isEnabled = false
        confirmButton.alpha = 0.5
        nameTextField.returnKeyType = .done
        phoneTextField.returnKeyType = .done
        
        nameTextField.delegate = self
        phoneTextField.delegate = self
        
        
        
        
        
        
        view.addSubview(nameLabel)
        view.addSubview(nameTextField)
        view.addSubview(phoneLabel)
        view.addSubview(warningLabel)
        view.addSubview(phoneTextField)
        view.addSubview(confirmButton)
        
        
        
    }
    
    //adding constraints
    private func setupConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneTextField.translatesAutoresizingMaskIntoConstraints = false
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        warningLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            //nameLabel
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            //nameTextField
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            
            nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameTextField.heightAnchor.constraint(equalToConstant: 40),
            //phoneLabel
            phoneLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            
            phoneLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            //warningLabel
            warningLabel.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 5),
            
            warningLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            //phoneTextfield
            phoneTextField.topAnchor.constraint(equalTo: warningLabel.bottomAnchor, constant: 20),
            
            phoneTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            phoneTextField.widthAnchor.constraint(equalTo:nameTextField.widthAnchor),
            //confirmButton
            confirmButton.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 50),
            confirmButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            confirmButton.widthAnchor.constraint(equalToConstant: 100),
            
            
            
            
        ])
    }
    
    
    @objc private func buttonTapped(_ sender: UIButton){
        
        
        
        let alert = UIAlertController(
            title: "Confirm Information",
            message: "Please confirm your name and phone number.\nName: \(nameTextField.text ?? "")\nPhone: \(phoneTextField.text ?? "")",
            preferredStyle: .alert
        )
        
        let confirmAction = UIAlertAction(title: "Confirm", style: .default) {[weak self] _ in
            guard let self else { return }
            let nextVC = PreferencesViewController()
            nextVC.name = nameTextField.text
            nextVC.phone = phoneTextField.text
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
        alert.addAction(confirmAction)
        
        alert.addAction(UIAlertAction(title: "Edit", style: .cancel))
        present(alert, animated: true)
        
    }
    @objc private func textFieldsChanged() {
        let isNameValid = !(nameTextField.text ?? "").isEmpty
        let isPhoneValid = (phoneTextField.text ?? "").count >= 9
        confirmButton.isEnabled = isNameValid && isPhoneValid
        confirmButton.alpha = confirmButton.isEnabled ? 1.0 : 0.5
        
    }
    
    
}

extension PersonalInfoViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // Dismiss keyboard
        return true
    }
}



#Preview{
    PersonalInfoViewController()
}
