//
//  FinalVCAssembly.swift
//  WinxSelected
//
//  Created by Ира on 02.11.2023.
//

import UIKit

protocol IFinalVCAssembly {
    func assemble(type: WinxCategory) -> UIViewController
}

final class FinalVCAssembly: IFinalVCAssembly {
    
    private let viewModelFactory: IFinalViewModelFactory
//    private let choiceVCAssembly: IChoiceVCAssembly
//    
//    // MARK: - Initialization
//    
    init(
        viewModelFactory: IFinalViewModelFactory = FinalViewModelFactory()
    ) {
        self.viewModelFactory = viewModelFactory
        
    }
    
    
    // MARK: - ITestAssembly
    
    func assemble(type: WinxCategory) -> UIViewController {
        
        let presenter = FinalVCPresenter(viewModelFactory: viewModelFactory, type: type)
  let thirdVC = FinalViewController( presenter: presenter)
//        let thirdVC = FinalViewController(title: res.0, subtitle: res.1, image: res.2, presenter: presenter)
      presenter.view = thirdVC
  thirdVC.navigationItem.hidesBackButton = true

    return thirdVC
    }
}
