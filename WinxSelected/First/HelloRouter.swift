//
//  HelloRouter.swift
//  WinxSelected
//
//  Created by Ира on 31.10.2023.
//

import UIKit

protocol IHelloRouter {
    func showNextScreen()
}

final class HelloRouter: IHelloRouter {
    
    weak var transitionHandler: UIViewController?
    private let choiceVCAssembly: IChoiceVCAssembly
    
    init(choiceVCAssembly: IChoiceVCAssembly) {
        self.choiceVCAssembly = choiceVCAssembly
    }
    

    func showNextScreen() {
//        let presenter = ChoiceVCPresenter()
//        let secondVC = ChoiceViewController(presenter: presenter)
//        presenter.view = secondVC
//        secondVC.navigationItem.hidesBackButton = true
        
        let nextVC = choiceVCAssembly.assemble()
        nextVC.navigationItem.hidesBackButton = true
        transitionHandler?.navigationController?.pushViewController(nextVC, animated: true)
    }
}


