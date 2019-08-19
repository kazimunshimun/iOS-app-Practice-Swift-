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

}

//MARK: Interactor -
protocol OnlineInteractorProtocol: class {

  var presenter: OnlinePresenterProtocol?  { get set }
}

//MARK: View -
protocol OnlineViewProtocol: class {

  var presenter: OnlinePresenterProtocol?  { get set }
}
