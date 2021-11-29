//
//  QuoteDetailPresenter.swift
//  VIPER
//
//  Created by iMac on 25.11.2021.
//

import Foundation

final class QuoteDetailPresenter: ViewToPresenterQuoteDetailProtocol {
	//MARK: Properties
	weak var view: PresenterToViewQuoteDetailProtocol?
	var interactor: PresenterToInteractorQuoteDetailProtocol?
	var router: PresenterToRouterQuoteDetailProtocol?

	//MARK: - Lifecycle
	func viewDidLoad() {
		print("Presenter is being notified that the View was loaded.")
		interactor?.getImageDataFromURL()
	}
}

//MARK: InteractorToPresenterQuoteDetailProtocol
extension QuoteDetailPresenter: InteractorToPresenterQuoteDetailProtocol {
	func getImageFromURLSuccess(quote: Quote, imageData: Data) {
		print("Presenter receives the success result from Interactor after it's done its job.")
		view?.onGetImageFromURLSuccess(quote.quote,
									   character: quote.character,
									   image: ImageDataService.shared.convertToUIImage(from: imageData))
	}

	func getImageFromURLFailure(quote: Quote) {
		print("Presenter receives the failure result from Interactor after it's done its job.")
		view?.onGetImageFromURLSuccess(quote.quote, character: quote.character)
	}
}
