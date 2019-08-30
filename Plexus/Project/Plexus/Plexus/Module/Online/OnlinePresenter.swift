//
//  OnlinePresenter.swift
//  Plexus
//
//  Created Anik on 19/8/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class OnlinePresenter: OnlinePresenterProtocol {

    weak private var view: OnlineViewProtocol?
    var interactor: OnlineInteractorProtocol?
    private let router: OnlineWireframeProtocol

    init(interface: OnlineViewProtocol, interactor: OnlineInteractorProtocol?, router: OnlineWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

}