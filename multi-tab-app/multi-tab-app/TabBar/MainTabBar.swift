//
//  MainTabBar.swift
//  multi-tab-app
//
//  Created by Lena Hunanian on 27.05.25.
//
import UIKit

class MainTabBar: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        let onboardingVC = OnboardingViewController()
        let onboardingNav = UINavigationController(rootViewController: onboardingVC)
        onboardingNav.tabBarItem = UITabBarItem(title: "Onboarding", image: UIImage(systemName: "rectangle.stack.person.crop"), tag: 0)
        
        let profileVC = ProfileViewController()
        let profileNav = UINavigationController(rootViewController: profileVC)
        profileNav.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.crop.circle"), tag: 1)
        
        let settingsVC = SettingsViewController()
        settingsVC.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 2)
        
        self.viewControllers = [onboardingNav, profileNav, settingsVC]
        
        if #available(iOS 13.0, *) {
                   let appearance = UITabBarAppearance()
                   appearance.configureWithOpaqueBackground()
                   appearance.backgroundColor = .orange
                   
                   appearance.stackedLayoutAppearance.selected.iconColor = .white
                   appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.white]
                   
                   appearance.stackedLayoutAppearance.normal.iconColor = .gray
                   appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.gray]
                   
                   tabBar.standardAppearance = appearance
                   if #available(iOS 15.0, *) {
                       tabBar.scrollEdgeAppearance = appearance
                   }
               } else {
                   tabBar.barTintColor = .orange
                   tabBar.tintColor = .white
                   tabBar.unselectedItemTintColor = .gray
               }
        
        
        
    }
    
    
}
#Preview {
    MainTabBar()
}
