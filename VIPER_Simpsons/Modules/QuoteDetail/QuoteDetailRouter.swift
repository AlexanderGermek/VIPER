//
//  QuoteDetailRouter.swift
//  VIPER
//
//  Created by iMac on 25.11.2021.
//

import UIKit

final class QuoteDetailRouter: PresenterToRouterQuoteDetailProtocol {
	static func createModule(with quote: Quote) -> UIViewController {
		print("QuoteDetailRouter creates the QuoteDetail module.")
		let quoteDetailVC = QuoteDetailViewController()

		let presenter: ViewToPresenterQuoteDetailProtocol &
			InteractorToPresenterQuoteDetailProtocol = QuoteDetailPresenter()

		quoteDetailVC.presenter = presenter
		quoteDetailVC.presenter?.router = QuoteDetailRouter()
		quoteDetailVC.presenter?.view = quoteDetailVC
		quoteDetailVC.presenter?.interactor = QuoteDetailInteractor()
		quoteDetailVC.presenter?.interactor?.quote = quote
		quoteDetailVC.presenter?.interactor?.presenter = presenter

		return quoteDetailVC
	}
}
