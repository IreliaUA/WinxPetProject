//
//  ChoiceVCAssembly.swift
//  WinxSelected
//
//  Created by Ира on 31.10.2023.
//

import UIKit

protocol IChoiceVCAssembly {
    func assemble() -> UIViewController
}

final class ChoiceVCAssembly: IChoiceVCAssembly {
    
    private let viewModelFactory: IChoiceViewModelFactory
    private let finalVCAssembly: IFinalVCAssembly
    
    // MARK: - Initialization
    
    init(
        viewModelFactory: IChoiceViewModelFactory = ChoiceViewModelFactory(),
        finalVCAssembly: IFinalVCAssembly = FinalVCAssembly()
    ) {
        self.viewModelFactory = viewModelFactory
        self.finalVCAssembly = finalVCAssembly
    }
    
    // MARK: - ITestAssembly
    
    func assemble() -> UIViewController {
        let router: ChoiceRouter = ChoiceRouter(finalVCAssembly: finalVCAssembly)

        let presenter: ChoiceVCPresenter = ChoiceVCPresenter(
            viewModelFactory: viewModelFactory,
            router: router
        )
        
        let viewController: ChoiceViewController = ChoiceViewController(presenter: presenter)
        
        presenter.view = viewController
        router.transitionHandler = viewController
//        let presenter = ChoiceVCPresenter()
//        let secondVC = ChoiceViewController(presenter: presenter)
//        presenter.view = secondVC
//        secondVC.navigationItem.hidesBackButton = true
//        
        return viewController
    }
}


