//
//  TestingAssembly.swift
//  WinxSelected
//
//  Created by Ира on 31.10.2023.
//
//

import UIKit

protocol ITestingAssembly {
  func assemble() -> UIViewController
}

final class TestingAssembly: ITestingAssembly {
  
  // Dependencies
  private let viewModelFactory: ITestingViewModelFactory
  // other services...
  
  // MARK: - Initialization
  
  init(viewModelFactory: ITestingViewModelFactory = TestingViewModelFactory()) {
    self.viewModelFactory = viewModelFactory
  }
  
  // MARK: - ITestingAssembly
  
  func assemble() -> UIViewController {
    let router: TestingRouter = TestingRouter()
    let presenter: TestingPresenter = TestingPresenter(
      viewModelFactory: viewModelFactory,
      router: router
    )
    
    let viewController: TestingViewController = TestingViewController(presenter: presenter)
    presenter.view = viewController
    router.transitionHandler = viewController
    
    return viewController
  }
}
