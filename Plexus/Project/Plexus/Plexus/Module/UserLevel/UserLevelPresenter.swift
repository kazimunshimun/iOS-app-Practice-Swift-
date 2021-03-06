//
//  UserLevelPresenter.swift
//  Plexus
//
//  Created Anik on 23/8/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class UserLevelPresenter: UserLevelPresenterProtocol {

    weak private var view: UserLevelViewProtocol?
    var interactor: UserLevelInteractorProtocol?
    private let router: UserLevelWireframeProtocol

    init(interface: UserLevelViewProtocol, interactor: UserLevelInteractorProtocol?, router: UserLevelWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

}
