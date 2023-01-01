//
//  BaseViewController.swift
//  Favgame
//
//  Created by deri indrawan on 27/12/22.
//

import UIKit
import Favgame_Core
import Favgame_About
import Favgame_Home
import Favgame_Search
import Favgame_Favorite

class BaseViewController: UITabBarController {
  // MARK: - Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setupBottomNav()
  }
  
  private func setupBottomNav() {
    let homeImage = UIImage(systemName: "gamecontroller")
    let homeVC = HomeRouter().container.resolve(HomeViewController.self)
    let home = templateNavigationController(image: homeImage, rootViewController: homeVC!, title: "Home")

    let searchImage = UIImage(systemName: "magnifyingglass")
    let searchVC = SearchRouter().container.resolve(SearchViewController.self)
    let search = templateNavigationController(image: searchImage, rootViewController: searchVC!, title: "Search")

    let favoriteImage = UIImage(systemName: "heart")
    let favoriteVC = FavoriteRouter().container.resolve(FavoriteViewController.self)
    let favorite = templateNavigationController(image: favoriteImage, rootViewController: favoriteVC!, title: "Favorite")
    
    let aboutImage = UIImage(systemName: "person")
    let aboutVC = AboutRouter().container.resolve(AboutViewController.self)
    let about = templateNavigationController(image: aboutImage, rootViewController: aboutVC!, title: "About")
    
    viewControllers = [home, search, favorite, about]
  }
  
  // MARK: - Helper
  private func templateNavigationController(image: UIImage?, rootViewController: UIViewController, title: String) -> UINavigationController {
    let nav = UINavigationController(rootViewController: rootViewController)
    nav.tabBarItem.image = image
    nav.tabBarItem.title = title
    nav.navigationBar.tintColor = UIColor.white
    
    tabBar.tintColor = UIColor.white
    tabBar.backgroundColor = UIColor(rgb: Constant.eastBayColor)
    tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
    tabBar.layer.shadowRadius = 2
    tabBar.layer.shadowColor = UIColor.black.cgColor
    tabBar.layer.shadowOpacity = 0.3
    return nav
  }
  
}
