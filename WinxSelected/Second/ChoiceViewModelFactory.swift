//
//  ChoiceViewModelFactory.swift
//  WinxSelected
//
//  Created by Ира on 02.11.2023.
//
//

import UIKit

protocol IChoiceViewModelFactory {
  func makeViewModel() -> ChoiceViewModel
}

final class ChoiceViewModelFactory: IChoiceViewModelFactory {
  
    func makeViewModel() -> ChoiceViewModel {
        let viewModel: ChoiceViewModel = ChoiceViewModel(
            models: [
                WinxModel(title: "Выбери качество \n которое лучше всего \n тебя описывает:", answer: [(.techna, "Умная", false), (.blum, "Лидер по жизни", false),(.flora, "Добрая", false)]),
                WinxModel(title: "Что ты смотришь по телевизору", answer: [(.flora, "Фильмы про \n природу", false), (.blum, "Модные шоу", false), (.techna, "Конференции эпл", false)]),
                WinxModel(title: "Какой цвет тебе \n больше нравится", answer: [(.flora, "Зеленый", false), (.blum, "Синий", false), (.techna, "Розовый", false)])
                
            ]
        )
        
        return viewModel
    }
}
