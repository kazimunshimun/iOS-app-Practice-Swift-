//
//  ProfileProtocols.swift
//  Plexus
//
//  Created Anik on 19/8/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import Foundation

//MARK: Wireframe -
protocol ProfileWireframeProtocol: class {

}
//MARK: Presenter -
protocol ProfilePresenterProtocol: class {
    func viewDidLoad()
}

//MARK: Interactor -
protocol ProfileInteractorProtocol: class {

    var presenter: ProfilePresenterProtocol?  { get set }
    var interactorOutput: ProfileInteractorOutputProtocol? { get set }
    var datamanager: ProfileDataManagerInputProtocol? { get set }
    
    func retrieveProfile()
}

protocol ProfileInteractorInputProtocol: class {
    
}

protocol ProfileInteractorOutputProtocol: class {
    func didRetrieveProfile(_ profile: ProfileRequest)
    func onError()
}

protocol ProfileDataManagerInputProtocol: class {
    var remoteRequestHandler: ProfileDataManagerOutputProtocol? { get set }
    
    // INTERACTOR -> REMOTEDATAMANAGER
    func retrieveProfile()
}

protocol ProfileDataManagerOutputProtocol: class {
    //DataManager->Interactor
    func onProfileRetrieved(_ profile: ProfileRequest)
    func onError()
}

//MARK: View -
protocol ProfileViewProtocol: class {

    var presenter: ProfilePresenterProtocol?  { get set }
    func showProfile(with profile: ProfileRequest)
    
    func showError()
    
    func showLoading()
    
    func hideLoading()
}
