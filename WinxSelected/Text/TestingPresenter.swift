//
//  TestingPresenter.swift
//  WinxSelected
//
//  Created by Ира on 31.10.2023.
//
//

import UIKit

protocol ITestingPresenter {
  func viewDidLoad()
  var viewModel: TestingViewModel? { get }
}

final class TestingPresenter: ITestingPresenter {
  
  /*
   // MARK: - Presenter
   Presenter - this class implements the interaction between the Model and the View and contains all the logic.
   Presenter can implement actions, class or service methods.
  */
  
  // Dependencies
  weak var view: ITestingViewController?
  private let viewModelFactory: ITestingViewModelFactory
  private let router: ITestingRouter
  
  // MARK: - Initialization
  
  init(
    viewModelFactory: ITestingViewModelFactory,
    router: ITestingRouter
  ) {
    self.viewModelFactory = viewModelFactory
    self.router = router
  }
  
  // MARK: - ITestingPresenter
  
  var viewModel: TestingViewModel?
  
  func viewDidLoad() {
    let createdViewModel = viewModelFactory.makeViewModel()
    viewModel = createdViewModel
    view?.setup(with: createdViewModel)
  }
}
