//
//  ChoiceVCPresenter.swift
//  WinxSelected
//
//  Created by Ира on 26.10.2023.
//

import UIKit

protocol IChoiceVCPresenter {
    func viewDidLoad()
    func showResultScreen()
    func saveChanges(switchNumber: Int)
    func updateValues()
    var currentQ: Int { get }
//    func viewDidload()
    
    
}

final class ChoiceVCPresenter: IChoiceVCPresenter {
    
    weak var view: IChoiceViewController?
    
    
    var questionModels: [WinxModel] = []
    var answers: [WinxModel] = []
    var currentQ = 0
    
    private let viewModelFactory: IChoiceViewModelFactory
    private let router: IChoiceRouter
    
    init(
      viewModelFactory: IChoiceViewModelFactory,
      router: IChoiceRouter
    ) {
      self.viewModelFactory = viewModelFactory
      self.router = router
    }
    

    
//    func viewDidload() {
//        let createdModel = viewModelFactory.makeViewModel()
//        view?.setup(with: createdModel)
//    }
    
    func viewDidLoad() {
        let createdModel = viewModelFactory.makeViewModel()
        questionModels = createdModel.models
        view?.updateUI(with: questionModels[currentQ])
    }
    
    func updateValues() {
        currentQ += 1
        view?.updateUI(with: questionModels[currentQ])
    }
    
//    private func setupContent() {
//        let model0 = WinxModel(title: "Выбери качество \n которое лучше всего \n тебя описывает:", answer: [(.techna, "Умная", false), (.blum, "Лидер по жизни", false),(.flora, "Добрая", false)])
//        let model1 = WinxModel(title: "Что ты смотришь по телевизору", answer: [(.flora, "Фильмы про \n природу", false), (.blum, "Модные шоу", false), (.techna, "Конференции эпл", false)])
//        let model2 = WinxModel(title: "Какой цвет тебе \n больше нравится", answer: [(.flora, "Зеленый", false), (.blum, "Синий", false), (.techna, "Розовый", false)])
//
//        questionModels.append(model0)
//        questionModels.append(model1)
//        questionModels.append(model2)
//    }
//
    func saveChanges(switchNumber: Int) {
        
        var answer: (WinxCategory, String, Bool) = questionModels[currentQ].answer[switchNumber]
        answer.2 = true
        let modelForSave = WinxModel(title: "", answer: [answer])
        answers.append(modelForSave)
    }
    
    private func calculateResult() -> WinxCategory {
        var blumCounter = 0
        var floraCounter = 0
        var tecnaCounter = 0
        answers.forEach { model in
            if model.answer[0].0 == .blum {
                blumCounter += 1
            }
            if model.answer[0].0 == .flora {
                floraCounter += 1
            }
            if model.answer[0].0 == .techna {
                tecnaCounter += 1
            }
        }
        
        var mostSelectedCategory: WinxCategory = .techna
        var maxCounter = 0
        
        if blumCounter > maxCounter {
            maxCounter = blumCounter
            mostSelectedCategory = .blum
        }
        
        if tecnaCounter > maxCounter {
            maxCounter = tecnaCounter
            mostSelectedCategory = .techna
        }
        
        if floraCounter > maxCounter {
            maxCounter = floraCounter
            mostSelectedCategory = .flora
        }
        return mostSelectedCategory
        
//        switch mostSelectedCategory {
//        case .blum:
//            return ("Ура! Ты фея Блум!\n Ты любишь модные шоу \n и нюхать попу ","Блум",UIImage(named: "Blum"))
//        case .techna:
//            return ("Ура! Ты фея Техна!\n Ты любишь технологии \n и хорошо в них разбираешься","Техна",UIImage(named: "Tehna"))
//        case .flora:
//            return ("Ура! Ты фея Флора!\n Ты любишь цветочки \n и хорошо в них разбираешься","Флора",UIImage(named: "Flora"))
//        }
    }
    
    func showResultScreen() {
        let res = calculateResult()
        router.showNextScreen(type: res)
    }
}
