//
//  ChoiceRouter.swift
//  WinxSelected
//
//  Created by Ира on 02.11.2023.
//
//

import UIKit

protocol IChoiceRouter {
  func showNextScreen(type: WinxCategory)
}

final class ChoiceRouter: IChoiceRouter {
  
  weak var transitionHandler: UIViewController?
    private let finalVCAssembly: IFinalVCAssembly
    
    init(finalVCAssembly: IFinalVCAssembly) {
        self.finalVCAssembly = finalVCAssembly
    }

  
  func showNextScreen(type: WinxCategory) {
      let nextVC = finalVCAssembly.assemble(type: type)
      nextVC.navigationItem.hidesBackButton = true
      transitionHandler?.navigationController?.pushViewController(nextVC, animated: true)
//      let presenter = FinalVCPresenter()
//      let thirdVC = FinalViewController(title: res.0, subtitle: res.1, image: res.2, presenter: presenter)
//      presenter.view = thirdVC
//      let nextVC = finalVCAssembly.assemble(res: (title: res.0, subtitle: res.1, image: res.2))
  }
}
