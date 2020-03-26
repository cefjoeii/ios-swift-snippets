//
//  XIBTabBarController.swift
//  A UITabBarController subclass implementation to avoid using Storyboards
//
//  Created by Ceferino Jose II on 26/03/2020.
//  Copyright © 2019 Ceferino Jose II. All rights reserved.
//

import UIKit

class XIBTabBarController: UITabBarController {
    // MARK: - ViewControllers
    lazy var tabVC1: UIViewController = {
        let vc = UIViewController()
        vc.tabBarItem.image = UIImage(named: "icon_tab_1")?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.selectedImage = UIImage(named: "icon_tab_1_selected")?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        // vc.tabBarItem.title = "tab_1".localized
        
        return vc
    }()
    
    lazy var tabVC2: UIViewController = {
        let vc = UIViewController()
        vc.tabBarItem.image = UIImage(named: "icon_tab_2")?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.selectedImage = UIImage(named: "icon_tab_2_selected")?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        // vc.tabBarItem.title = "tab_2".localized
        
        return vc
    }()
    
    lazy var tabVC3: UIViewController = {
        let vc = UIViewController()
        vc.tabBarItem.image = UIImage(named: "icon_tab_3")?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.selectedImage = UIImage(named: "icon_tab_3_selected")?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        // vc.tabBarItem.title = "tab_3".localized
        
        return vc
    }()
    
    lazy var tabVC4: UIViewController = {
        let vc = UIViewController()
        vc.tabBarItem.image = UIImage(named: "icon_tab_4")?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.selectedImage = UIImage(named: "icon_tab_4_selected")?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        // vc.tabBarItem.title = "tab_4".localized
        
        return vc
    }()
    
    lazy var tabVC5: UIViewController = {
        let vc = UIViewController()
        vc.tabBarItem.image = UIImage(named: "icon_tab_5")?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.selectedImage = UIImage(named: "icon_tab_5_selected")?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        // vc.tabBarItem.title = "tab_5".localized
        
        return vc
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        let vcs = [
            self.tabVC1,
            self.tabVC2,
            self.tabVC3,
            self.tabVC4,
            self.tabVC5
        ]
        
        // See: https://bit.ly/2YdOQPa
        self.viewControllers = vcs.map { UINavigationController(rootViewController: $0) }
        
        self.tabBar.backgroundColor = .white
        self.tabBar.isTranslucent = false
        self.tabBar.layer.borderWidth = 0.5
        self.tabBar.layer.borderColor = UIColor.hcmGrey.cgColor
        self.tabBar.clipsToBounds = true
    }
}

// Customize the height of the native iOS tab bar
extension UITabBar {
    static let height: CGFloat = 55

    override open func sizeThatFits(_ size: CGSize) -> CGSize {
        guard let window = UIApplication.shared.keyWindow else {
            return super.sizeThatFits(size)
        }
        var sizeThatFits = super.sizeThatFits(size)
        if #available(iOS 11.0, *) {
            sizeThatFits.height = UITabBar.height + window.safeAreaInsets.bottom
        } else {
            sizeThatFits.height = UITabBar.height
        }
        return sizeThatFits
    }
}
