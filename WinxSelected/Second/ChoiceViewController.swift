//
//  ChoiceViewController.swift
//  WinxSelected
//
//  Created by Ира on 04.10.2023.
//

import UIKit

protocol IChoiceViewController: UIViewController {
    func updateUI(with model: WinxModel)
}

final class ChoiceViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var firstSwitchLabel: UILabel!
    @IBOutlet private weak var firstSwitch: UISwitch!
    @IBOutlet private weak var secondSwitchlabel: UILabel!
    @IBOutlet private weak var secondSwitch: UISwitch!
    @IBOutlet private weak var thirdSwitchlabel: UILabel!
    @IBOutlet private weak var thirdSwitch: UISwitch!
    @IBOutlet private weak var finalButton: UIButton!
    
    // MARK: - Properties
    
//    private var questionModels: [WinxModel] = []
//    private var answers: [WinxModel] = []
    //private var currentQ = 0
    private var presenter: IChoiceVCPresenter
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        setupUI()
    }
    
    init(presenter: IChoiceVCPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
//    private func setupContent() {
//        let model0 = WinxModel(title: "Выбери качество \n которое лучше всего \n тебя описывает:", answer: [(.techna, "Умная", false), (.blum, "Лидер по жизни", false),(.flora, "Добрая", false)])
//        let model1 = WinxModel(title: "Что ты смотришь по телевизору", answer: [(.flora, "Фильмы про \n природу", false), (.blum, "Модные шоу", false), (.techna, "Конференции эпл", false)])
//        let model2 = WinxModel(title: "Какой цвет тебе \n больше нравится", answer: [(.flora, "Зеленый", false), (.blum, "Синий", false), (.techna, "Розовый", false)])
//        
//        questionModels.append(model0)
//        questionModels.append(model1)
//        questionModels.append(model2)
//    }
    
    private func setupUI() {
        finalButton.layer.cornerRadius = 12
    }
    
//    private func saveChanges(switchNumber: Int) {
//        var answer: (WinxCategory, String, Bool) = questionModels[currentQ].answer[switchNumber]
//        answer.2 = true
//        let modelForSave = WinxModel(title: "", answer: [answer])
//        answers.append(modelForSave)
//    }
    
//    private func calculateResult() -> (String, String, UIImage?) {
//        var blumCounter = 0
//        var floraCounter = 0
//        var tecnaCounter = 0
//        answers.forEach { model in
//            if model.answer[0].0 == .blum {
//                blumCounter += 1
//            }
//            if model.answer[0].0 == .flora {
//                floraCounter += 1
//            }
//            if model.answer[0].0 == .techna {
//                tecnaCounter += 1
//            }
//        }
//        
//        var mostSelectedCategory: WinxCategory = .techna
//        var maxCounter = 0
//        
//        if blumCounter > maxCounter {
//            maxCounter = blumCounter
//            mostSelectedCategory = .blum
//        }
//        
//        if tecnaCounter > maxCounter {
//            maxCounter = tecnaCounter
//            mostSelectedCategory = .techna
//        }
//        
//        if floraCounter > maxCounter {
//            maxCounter = floraCounter
//            mostSelectedCategory = .flora
//        }
//        
//        switch mostSelectedCategory {
//        case .blum:
//            return ("Ура! Ты фея Блум!\n Ты любишь модные шоу \n и нюхать попу ","Блум",UIImage(named: "Blum"))
//        case .techna:
//            return ("Ура! Ты фея Техна!\n Ты любишь технологии \n и хорошо в них разбираешься","Техна",UIImage(named: "Tehna"))
//        case .flora:
//            return ("Ура! Ты фея Флора!\n Ты любишь цветочки \n и хорошо в них разбираешься","Флора",UIImage(named: "Flora"))
//        }
//    }
    
    // MARK: - IBActions
    
    @IBAction private func firstSwitchAction(_ sender: UISwitch) {
        if sender.isOn{
            secondSwitch.setOn(false, animated: true)
            thirdSwitch.setOn(false, animated: true)
        }
    }
    @IBAction private func secondSwitchAction(_ sender: UISwitch) {
        if sender.isOn{
            firstSwitch.setOn(false, animated: true)
            thirdSwitch.setOn(false, animated: true)
        }
    }
    @IBAction private func thirdSwitchAction(_ sender: UISwitch) {
        if sender.isOn{
            secondSwitch.setOn(false, animated: true)
            firstSwitch.setOn(false, animated: true)
        }
    }
    
    @IBAction private func finalButtonAction(_ sender: UIButton) {
        
        if firstSwitch.isOn || secondSwitch.isOn || thirdSwitch.isOn {
            if firstSwitch.isOn {
                presenter.saveChanges(switchNumber: 0)
            }
            if secondSwitch.isOn {
                presenter.saveChanges(switchNumber: 1)
            }
            if thirdSwitch.isOn {
                presenter.saveChanges(switchNumber: 2)
            }
            if presenter.currentQ == 2 {
                presenter.showResultScreen()
               
                //можно перенести
//                let res = presenter.calculateResult()
//                let thirdVC = FinalViewController(title: res.0, subtitle: res.1, image: res.2)
//                thirdVC.navigationItem.hidesBackButton = true
//                self.navigationController?.pushViewController(thirdVC, animated: true)
                //можно перенести
            } else {
                presenter.updateValues()
            }
        } else {
            return
        }
    }
}

// MARK: - Extensions

extension ChoiceViewController: IChoiceViewController {
    func updateUI(with model: WinxModel) {
        titleLabel.text = model.title
        firstSwitchLabel.text = model.answer[0].1
        secondSwitchlabel.text = model.answer[1].1
        thirdSwitchlabel.text = model.answer[2].1
        firstSwitch.isOn = false
        secondSwitch.isOn = false
        thirdSwitch.isOn = false
    }
//        func setup(with model: WinxModel) {
////            titleLabel.text = model.titleText
////            doYouLabel.text = model.subtitleText
////            blumImage.image = model.blumeImage
////            blumLabel.text = model.blumeText
////            texnaImage.image = model.tecnaImage
////            texnaLabel.text = model.tecnaText
////            floraImage.image = model.floraImage
////            floraLabel.text = model.floraText
////            startButton.setTitle(model.buttonTitle, for: .normal)
//        }
    }
