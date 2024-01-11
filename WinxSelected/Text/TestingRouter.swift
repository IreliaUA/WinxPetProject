//
//  TestingRouter.swift
//  WinxSelected
//
//  Created by Ира on 31.10.2023.
//
//

import UIKit

protocol ITestingRouter {
  func showNextScreen()
}

final class TestingRouter: ITestingRouter {
  
  weak var transitionHandler: UIViewController?
  
  /*
   // MARK: - Router
   Router - this class is used to implement the transition functionality and show other screens.
   Use an initializer for injection assembly other screens, and transitionHandler as the screen from which the next screen will be shown
   
   init(nextScreenAssembly: InextScreenAssembly) {
      self.nextScreenAssembly = nextScreenAssembly
   }
   */
  
  func showNextScreen() {
  }
}
