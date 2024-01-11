//
//  TestingViewModelFactory.swift
//  WinxSelected
//
//  Created by Ира on 31.10.2023.
//
//

import UIKit

protocol ITestingViewModelFactory {
  func makeViewModel() -> TestingViewModel
}

final class TestingViewModelFactory: ITestingViewModelFactory {
  
  func makeViewModel() -> TestingViewModel {
    let viewModel: TestingViewModel = TestingViewModel()
    return viewModel
  }
}
