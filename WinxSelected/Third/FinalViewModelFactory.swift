//
//  FinalViewModelFactory.swift
//  WinxSelected
//
//  Created by Ира on 02.11.2023.
//

import UIKit

protocol IFinalViewModelFactory {
    func makeViewModel(type: WinxCategory) -> FinalViewModel
}

final class FinalViewModelFactory: IFinalViewModelFactory {
    
    func makeViewModel(type: WinxCategory) -> FinalViewModel {
        let viewModel: FinalViewModel
        
        switch type {
            
        case .blum:
            viewModel = FinalViewModel(
                titleLabel: "Результат:", mainTitleN: "Ура! Ты фея Блум!\n Ты любишь модные шоу \n и тусовки",
                imageN: UIImage(named: "Blum"), subtitleN: "Блум"
            )
        case .techna:
            viewModel = FinalViewModel(
                titleLabel: "Результат:", mainTitleN: "Ура! Ты фея Техна!\n Ты любишь технологии \n и хорошо в них разбираешься",
                imageN: UIImage(named: "Tehna"), subtitleN: "Техна"
            )
        case .flora:
            viewModel = FinalViewModel(
                titleLabel: "Результат:", mainTitleN: "Ура! Ты фея Флора!\n Ты любишь цветы и птиц \n и хорошо в них разбираешься",
                imageN: UIImage(named: "Flora"), subtitleN: "Флора"
            )
        }
        
        
        return viewModel
    }
}

