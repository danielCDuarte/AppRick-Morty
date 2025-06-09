//
//  SearchCharacterContract.swift
//  AppRick&Morty
//
//  Created by Daniel Crespo Duarte on 9/06/25.
//

import Foundation
import SwiftUI

protocol SearchCharacterViewModelType: ObservableObject {
    var state: SearchCharacterState { get set }
    func searchCharacter(query: String)
    func onAppear()
    func onDisAppear()
}
