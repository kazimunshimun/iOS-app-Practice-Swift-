//
//  SignInPresenter.swift
//  Plexus
//
//  Created Anik on 16/8/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class SignInPresenter: SignInPresenterProtocol {

    weak private var view: SignInViewProtocol?
    var interactor: SignInInteractorProtocol?
    private let router: SignInWireframeProtocol

    init(interface: SignInViewProtocol, interactor: SignInInteractorProtocol?, router: SignInWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

}