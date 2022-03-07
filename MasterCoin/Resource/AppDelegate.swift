//
//  AppDelegate.swift
//  MasterCoin
//
//  Created by Nikolas Gianoglou Coelho on 07/03/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    let rootViewController = ListCoinViewController()
    let navigationController = UINavigationController(rootViewController: rootViewController)
    self.window = UIWindow(frame: UIScreen.main.bounds)
    self.window?.rootViewController = navigationController
    self.window?.makeKeyAndVisible()
    
    return true
  }




}

