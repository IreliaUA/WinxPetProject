//
//  FinalViewController.swift
//  WinxSelected
//
//  Created by Ира on 04.10.2023.
//

import UIKit

protocol IFinalViewController: UIViewController {
    func setupUI(with model: FinalViewModel)
}

final class FinalViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var mainTitleN: UILabel!
    @IBOutlet private weak var imageN: UIImageView!
    @IBOutlet private weak var subtitleN: UILabel!
    
    // MARK: - Properties
    
    private var presenter: IFinalVCPresenter
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    init( presenter: IFinalVCPresenter) {
        
//        self.image = image
//        self.subtitle = subtitle
//        self.mainTitle = title
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
//    private func setupUI() {
//        mainTitleN.text = mainTitle
//        subtitleN.text = subtitle
//        imageN.image = image
//    }
}

// MARK: - Extensions
extension FinalViewController: IFinalViewController {
        func setupUI(with model: FinalViewModel) {
            titleLabel.text = model.titleLabel
            mainTitleN.text = model.mainTitleN
            imageN.image = model.imageN
            subtitleN.text = model.subtitleN
    }
}
