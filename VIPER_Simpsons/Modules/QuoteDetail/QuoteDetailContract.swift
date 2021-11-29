//
//  QuoteDetailContract.swift
//  VIPER
//
//  Created by iMac on 25.11.2021.
//

import UIKit

//MARK: Presenter Input (View -> Presenter)
protocol ViewToPresenterQuoteDetailProtocol {
	var view: PresenterToViewQuoteDetailProtocol? { get set }
	var interactor: PresenterToInteractorQuoteDetailProtocol? { get set }
	var router: PresenterToRouterQuoteDetailProtocol? { get set }
	func viewDidLoad()
}

//MARK: Presenter Output (Presenter -> View)
protocol PresenterToViewQuoteDetailProtocol: class {
	func onGetImageFromURLSuccess(_ quote: String, character: String, image: UIImage?)
	func onGetImageFromURLSuccess(_ quote: String, character: String)
}



//MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorQuoteDetailProtocol: class {
	var presenter: InteractorToPresenterQuoteDetailProtocol? { get set }
	var quote: Quote? { get set }
	func getImageDataFromURL()
}

//MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterQuoteDetailProtocol: class {
	func getImageFromURLSuccess(quote: Quote, imageData: Data)
	func getImageFromURLFailure(quote: Quote)
}



//MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterQuoteDetailProtocol: class {
	static func createModule(with quote: Quote) -> UIViewController
}
