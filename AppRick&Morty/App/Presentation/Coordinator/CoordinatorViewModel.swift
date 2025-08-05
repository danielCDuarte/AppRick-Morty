//
//  CoordinatorViewModel.swift
//  AppRick&Morty
//
//  Created by Daniel Crespo Duarte on 5/08/25.
//

import Foundation

protocol CoordinatorViewModel: ObservableObject {
    var coordinator: AppCoordinator { get }
}
