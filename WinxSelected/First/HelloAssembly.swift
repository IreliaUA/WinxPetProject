//
//  HelloAssembly.swift
//  WinxSelected
//
//  Created by Ира on 31.10.2023.
//

import UIKit

protocol IHelloAssembly {
    func assemble() -> UIViewController
}

final class HelloAssembly: IHelloAssembly {
        
    private let viewModelFactory: IHelloViewModelFactory
    private let choiceVCAssembly: IChoiceVCAssembly
    
    // MARK: - Initialization
    
    init(
        viewModelFactory: IHelloViewModelFactory = HelloViewModelFactory(),
        choiceVCAssembly: IChoiceVCAssembly = ChoiceVCAssembly()
    ) {
        self.viewModelFactory = viewModelFactory
        self.choiceVCAssembly = choiceVCAssembly
    }
    
    // MARK: - ITestAssembly
    
    func assemble() -> UIViewController {
        let router: HelloRouter = HelloRouter(choiceVCAssembly: choiceVCAssembly)
        
        let presenter: HelloVCPresenter = HelloVCPresenter(
            viewModelFactory: viewModelFactory,
            router: router
        )
        
        let viewController: HelloViewController = HelloViewController(presenter: presenter)
        
        presenter.view = viewController
        router.transitionHandler = viewController
        
        return viewController
    }
}

