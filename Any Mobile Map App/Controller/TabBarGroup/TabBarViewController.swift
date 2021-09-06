//
//  TabBarViewController.swift
//  Any Mobile Map App
//
//  Created by Jasur Salimov on 8/24/21.
//
import Foundation
import UIKit

class TabBarViewController: UITabBarController {
    var customTabBarView = UIView(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBars()
       
    }
}
//MARK: - TabBar appearance and methods

extension TabBarViewController {
    
    private func setTabBars(){
        let vc1 = UINavigationController(rootViewController: BookmarkViewController())
        let vc2 = LocationViewController()
        let vc3 = AccountViewController()
//        vc1.title = "Bookmark"
//        vc2.title = "Map"
//        vc3.title = "Account"
        
        //Chang the tab bar image positioning: Default position was too high!
        vc1.tabBarItem.imageInsets = UIEdgeInsets(top: 20, left: 0, bottom: -20, right: 0)
        vc2.tabBarItem.imageInsets = UIEdgeInsets(top: 20, left: 0, bottom: -20, right: 0)
        vc3.tabBarItem.imageInsets = UIEdgeInsets(top: 20, left: 0, bottom: -20, right: 0)
        //Set the tab bar icons
        vc1.tabBarItem.image = UIImage(named: Constants.imageName[1])
        vc2.tabBarItem.image = UIImage(named: Constants.imageName[2])
        vc3.tabBarItem.image = UIImage(named: Constants.imageName[0])
        self.setViewControllers([vc1,vc2,vc3], animated: false)
    
        self.setupTabBarUI()
        self.addCustomTabBarView()
        
    }
    
    private func setupCustomTabBarFrame() {
        let height = self.view.safeAreaInsets.bottom + 64
        
        var tabFrame = self.tabBar.frame
        tabFrame.size.height = height
        tabFrame.origin.y = self.view.frame.size.height - height
        
        self.tabBar.frame = tabFrame
        self.tabBar.setNeedsLayout()
        self.tabBar.layoutIfNeeded()
        customTabBarView.frame = tabBar.frame
    }
    
    private func setupTabBarUI() {
        // Setup your colors and corner radius
        self.tabBar.backgroundColor = UIColor.fillColor
        self.tabBar.clipsToBounds = true
        self.tabBar.layer.cornerRadius = 20
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
     
        self.tabBar.backgroundColor = .fillColor
        self.tabBar.tintColor = .black
        self.tabBar.unselectedItemTintColor = UIColor.fillColor3
        
        // Remove the line
        if #available(iOS 13.0, *) {
            let appearance = self.tabBar.standardAppearance
            appearance.shadowImage = nil
            appearance.shadowColor = nil
            self.tabBar.standardAppearance = appearance
        } else {
            self.tabBar.shadowImage = UIImage()
            self.tabBar.backgroundImage = UIImage()
        }
    }
    
    private func addCustomTabBarView() {
        self.customTabBarView.frame = tabBar.frame
        
        self.customTabBarView.backgroundColor = .fillColor
        self.customTabBarView.layer.cornerRadius = 30
        self.customTabBarView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]

        self.customTabBarView.layer.masksToBounds = false
        self.customTabBarView.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        self.customTabBarView.layer.shadowOffset = CGSize(width: -4, height: -6)
        self.customTabBarView.layer.shadowOpacity = 0.5
        self.customTabBarView.layer.shadowRadius = 20
        
        self.view.addSubview(customTabBarView)
        self.view.bringSubviewToFront(self.tabBar)
    }
}

extension UIColor {
    static let fillColor = UIColor(named: "fillColor")
    static let fillColor3 = UIColor(named: "fillColor3")
}
