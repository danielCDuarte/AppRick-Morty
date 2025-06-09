//
//  DetailCharacterContract.swift
//  AppRick&Morty
//
//  Created by Daniel Crespo Duarte on 9/06/25.
//

import Foundation
import SwiftUI

protocol DetailCharacterViewModelType: ObservableObject {
    var state: DetailCharacterState { get set }
    func onDisAppear()
}
