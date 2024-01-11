//
//  HelloViewController.swift
//  WinxSelected
//
//  Created by Ира on 04.10.2023.
//

import UIKit

protocol IHelloViewController: UIViewController {
    func setup(with model: HelloViewModel)
}

final class HelloViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var doYouLabel: UILabel!
    @IBOutlet private weak var blumImage: UIImageView!
    @IBOutlet private weak var blumLabel: UILabel!
    @IBOutlet private weak var texnaImage: UIImageView!
    @IBOutlet private weak var texnaLabel: UILabel!
    @IBOutlet private weak var floraImage: UIImageView!
    @IBOutlet private weak var floraLabel: UILabel!
    @IBOutlet private weak var startButton: UIButton!
    
    // MARK: - Properties
    
    private var presenter: IHelloVCPresenter
    var result = 0
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        setupUI()
    }
    
    init(presenter: IHelloVCPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        startButton.layer.cornerRadius = 12
        startButton.backgroundColor = UIColor(named: "buttonColor")
    }
    
    // MARK: - IBActions
    
    @IBAction private func startButtonAction(_ sender: UIButton) {
        presenter.showNextScreen()
    }
}

// MARK: - Extensions

extension HelloViewController: IHelloViewController {
    func setup(with model: HelloViewModel) {
        titleLabel.text = model.titleText
        doYouLabel.text = model.subtitleText
        blumImage.image = model.blumeImage
        blumLabel.text = model.blumeText
        texnaImage.image = model.tecnaImage
        texnaLabel.text = model.tecnaText
        floraImage.image = model.floraImage
        floraLabel.text = model.floraText
        startButton.setTitle(model.buttonTitle, for: .normal)
    }
}
