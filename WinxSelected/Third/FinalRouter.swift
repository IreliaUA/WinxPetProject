//
//  FinalRouter.swift
//  WinxSelected
//
//  Created by Ира on 02.11.2023.
//

import UIKit

protocol IFinalRouter {
  func showNextScreen(type: WinxCategory)
}

final class FinalRouter: IFinalRouter {
  
  weak var transitionHandler: UIViewController?
  
  /*
   // MARK: - Router
   Router - this class is used to implement the transition functionality and show other screens.
   Use an initializer for injection assembly other screens, and transitionHandler as the screen from which the next screen will be shown
   
   init(nextScreenAssembly: InextScreenAssembly) {
      self.nextScreenAssembly = nextScreenAssembly
   }
   */
  
  func showNextScreen(type: WinxCategory) {
      
  }
}
