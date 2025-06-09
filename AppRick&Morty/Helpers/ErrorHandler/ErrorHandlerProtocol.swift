//
//  ErrorHandlerProtocol.swift
//  AppRick&Morty
//
//  Created by Daniel Crespo Duarte on 9/06/25.
//

import Foundation

protocol ErrorHandlerProtocol: AnyObject {
    func showError(error: Error)
}

protocol ErrorProcessorProtocol {
    var errorHandler: ErrorHandlerProtocol? { get set }
}
