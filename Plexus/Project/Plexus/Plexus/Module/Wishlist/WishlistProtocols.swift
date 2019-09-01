//
//  WishlistProtocols.swift
//  Plexus
//
//  Created Anik on 19/8/19.
//  Copyright © 2019 A7Studio. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import Foundation

//MARK: Wireframe -
protocol WishlistWireframeProtocol: class {
    
}
//MARK: Presenter -
protocol WishlistPresenterProtocol: class {
    func viewDidLoad()
}

//MARK: Interactor -
protocol WishlistInteractorProtocol: class {

  var presenter: WishlistPresenterProtocol?  { get set }
    var interactorOutput: WishlistInteractorOutputProtocol? { get set }
    var datamanager: WishlistDataManagerInputProtocol? { get set }
    
    func retrieveWishlistCourses()
}

protocol WishlistInteractorInputProtocol: class {
    
}

protocol WishlistInteractorOutputProtocol: class {
    func didRetrieveWishlistCourses(_ posts: [WishlistRequest])
    func onError()
}

protocol WishlistDataManagerInputProtocol: class {
    var remoteRequestHandler: WishlistDataManagerOutputProtocol? { get set }
    
    // INTERACTOR -> REMOTEDATAMANAGER
    func retrieveWishlistCourses()
}

protocol WishlistDataManagerOutputProtocol: class {
    //DataManager->Interactor
    func onWishlistCoursesRetrieved(_ courses: [WishlistRequest])
    func onError()
}

//MARK: View -
protocol WishlistViewProtocol: class {

    var presenter: WishlistPresenterProtocol?  { get set }
    
    func showWishlistCourses(with courses: [WishlistRequest])
    
    func showError()
    
    func showLoading()
    
    func hideLoading()
}
