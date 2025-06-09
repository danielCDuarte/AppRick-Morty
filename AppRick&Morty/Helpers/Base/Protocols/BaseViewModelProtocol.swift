//
//  BaseViewModelProtocol.swift
//  AppRick&Morty
//
//  Created by Daniel Crespo Duarte on 9/06/25.
//

import Foundation

protocol BaseViewModelProtocol {
    
    var view: BaseView? {get set}
    
    func bind(withView view: BaseView)
    func unBind()
    func viewAppear()
    func viewDidAppear()
    func getInitialState()
}
