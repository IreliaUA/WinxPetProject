//
//  TestingViewController.swift
//  WinxSelected
//
//  Created by Ира on 31.10.2023.
//
//

import UIKit

protocol ITestingViewController: AnyObject {
  func setup(with: TestingViewModel)
}

final class TestingViewController: UIViewController {
  
  // MARK: - IBOutlet
  
  // MARK: - Properties
  
  private let presenter: ITestingPresenter
  
  // MARK: - Lifecycle
  
  init(presenter: ITestingPresenter) {
    self.presenter = presenter
    
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupUI()
    presenter.viewDidLoad()
  }
  
  // MARK: - Private Methods
  
  private func setupUI() {
  }
  
  // MARK: - IBActions
  
}

// MARK: - Extensions

extension TestingViewController: ITestingViewController {
  func setup(with viewModel: TestingViewModel) {
  }
}
