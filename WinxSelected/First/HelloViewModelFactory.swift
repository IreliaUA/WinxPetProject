//
//  HelloViewModelFactory.swift
//  WinxSelected
//
//  Created by Ира on 31.10.2023.
//

import UIKit

protocol IHelloViewModelFactory {
  func makeViewModel() -> HelloViewModel
}

final class HelloViewModelFactory: IHelloViewModelFactory {
  
  func makeViewModel() -> HelloViewModel {
      let viewModel: HelloViewModel = HelloViewModel(
        titleText: "Добро пожаловать!",
        subtitleText: "Узнай какая ты фея винкс:",
        blumeImage: UIImage(named: "Blum"),
        floraImage: UIImage(named: "Flora"),
        tecnaImage: UIImage(named: "Tehna"),
        blumeText: "Блум",
        floraText: "Флора",
        tecnaText: "Техна",
        buttonTitle: "Начать"
      )
      
    return viewModel
  }
}
