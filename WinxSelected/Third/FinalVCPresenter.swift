//
//  FinalVCPresenter.swift
//  WinxSelected
//
//  Created by Ира on 26.10.2023.
//

import UIKit

protocol IFinalVCPresenter {
    func viewDidLoad()
}

final class FinalVCPresenter: IFinalVCPresenter {

    
    weak var view: IFinalViewController?

    private let viewModelFactory: IFinalViewModelFactory
    private let type: WinxCategory
    
    init(
        viewModelFactory: IFinalViewModelFactory,
        type: WinxCategory
    ) {
      self.viewModelFactory = viewModelFactory
        self.type = type
    }
    
    func viewDidLoad() {
        let createdModel = viewModelFactory.makeViewModel(type: type)
        view?.setupUI(with: createdModel)
    }
}
