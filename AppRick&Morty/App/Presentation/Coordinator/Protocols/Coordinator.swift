//
//  Coordinator.swift
//  AppRick&Morty
//
//  Created by Daniel Crespo Duarte on 5/08/25.
//

import Foundation
import SwiftUI

protocol Coordinator: ObservableObject {
    var navigationPath: NavigationPath { get set }
    func start()
    func navigateTo(_ destination: CoordinatorDestination)
    func navigateBack()
    func popToRoot()
}
