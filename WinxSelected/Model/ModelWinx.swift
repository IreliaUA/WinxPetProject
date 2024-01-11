//
//  ModelWinx.swift
//  WinxSelected
//
//  Created by Ира on 07.10.2023.
//

import Foundation

struct WinxModel {
    var title: String
    var answer: [(WinxCategory, String, Bool)]
}

enum WinxCategory {
    case blum, techna, flora
}
