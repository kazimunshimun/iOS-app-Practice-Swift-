//
//  OnlineProtocols.swift
//  Plexus
//
//  Created Anik on 19/8/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import Foundation

//MARK: Wireframe -
protocol OnlineWireframeProtocol: class {

}
//MARK: Presenter -
protocol OnlinePresenterProtocol: class {
    func viewDidLoad()
}

//MARK: Interactor -
protocol OnlineInteractorProtocol: class {

    var presenter: OnlinePresenterProtocol?  { get set }
    
    var interactorOutput: OnlineInteractorOutputProtocol? { get set }
    var datamanager: OnlineDataManagerInputProtocol? { get set }
    
    func retrieveOnlineCourses()
}


protocol OnlineInteractorInputProtocol: class {
    
}

protocol OnlineInteractorOutputProtocol: class {
    func didRetrieveOnlineCourses(_ posts: [OnlineRequest])
    func onError()
}

protocol OnlineDataManagerInputProtocol: class {
    var remoteRequestHandler: OnlineDataManagerOutputProtocol? { get set }
    
    // INTERACTOR -> REMOTEDATAMANAGER
    func retrieveOnlineCourses()
}

protocol OnlineDataManagerOutputProtocol: class {
    //DataManager->Interactor
    func onOnlineCoursesRetrieved(_ courses: [OnlineRequest])
    func onError()
}

//MARK: View -
protocol OnlineViewProtocol: class {

    var presenter: OnlinePresenterProtocol?  { get set }
    
    func showOnlineCourses(with courses: [OnlineRequest])
    
    func showError()
    
    func showLoading()
    
    func hideLoading()
}
