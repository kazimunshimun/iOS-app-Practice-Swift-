//
//  OnlineRouter.swift
//  Plexus
//
//  Created Anik on 19/8/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class OnlineRouter: OnlineWireframeProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule(view: OnlineViewController) {
        // Change to get view from storyboard if not using progammatic UI
       // let view = OnlineViewController(nibName: nil, bundle: nil)
        let interactor: OnlineInteractorProtocol & OnlineDataManagerOutputProtocol = OnlineInteractor()
        let router = OnlineRouter()
        let presenter: OnlinePresenterProtocol & OnlineInteractorOutputProtocol = OnlinePresenter(interface: view, interactor: interactor, router: router)
        
        let remoteDataManager: OnlineDataManagerInputProtocol = OnlineCouseDataManager()
        
        view.presenter = presenter
        interactor.interactorOutput = presenter
        interactor.datamanager = remoteDataManager as? OnlineCouseDataManager
        router.viewController = view
        remoteDataManager.remoteRequestHandler = interactor

    }
}
