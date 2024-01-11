//
//  HelloVCPresenter.swift
//  WinxSelected
//
//  Created by Ира on 26.10.2023.
//

import UIKit

protocol IHelloVCPresenter {
    func showNextScreen()
    func viewDidLoad()
}

final class HelloVCPresenter: IHelloVCPresenter {
    weak var view: IHelloViewController?
    
    private let viewModelFactory: IHelloViewModelFactory
    private let router: IHelloRouter
    
    init(
      viewModelFactory: IHelloViewModelFactory,
      router: IHelloRouter
    ) {
      self.viewModelFactory = viewModelFactory
      self.router = router
    }
    
    func showNextScreen() {
        router.showNextScreen()
    }
    
    func viewDidLoad() {
        let createdModel = viewModelFactory.makeViewModel()
        view?.setup(with: createdModel)
    }
}

//extension HelloVCPresenter: IHelloVCPresenter {
//    func showNextScreen() {
//        let presenter = ChoiceVCPresenter()
//        let secondVC = ChoiceViewController(presenter: presenter)
//        presenter.view = secondVC
//        secondVC.navigationItem.hidesBackButton = true
//        view?.navigationController?.pushViewController(secondVC, animated: true)
//    }
//}
