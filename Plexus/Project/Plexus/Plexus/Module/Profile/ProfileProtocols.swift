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

}

//MARK: Interactor -
protocol ProfileInteractorProtocol: class {

  var presenter: ProfilePresenterProtocol?  { get set }
}

//MARK: View -
protocol ProfileViewProtocol: class {

  var presenter: ProfilePresenterProtocol?  { get set }
}