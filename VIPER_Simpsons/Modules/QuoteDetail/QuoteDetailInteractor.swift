//
//  QuoteDetailInteractor.swift
//  VIPER
//
//  Created by iMac on 25.11.2021.
//

import Foundation
import SDWebImage

final class QuoteDetailInteractor: PresenterToInteractorQuoteDetailProtocol {
	//MARK: Properties
	weak var presenter: InteractorToPresenterQuoteDetailProtocol?

	var quote: Quote?

	//MARK: Func's
	func getImageDataFromURL() {
		guard let quote = quote, let imageURL = URL(string: quote.image) else { return }

		SDWebImageDownloader.shared.downloadImage(with: imageURL) { (_, data, error, success) in
			guard let data = data, error == nil else { return }
			if success {
				self.presenter?.getImageFromURLSuccess(quote: quote, imageData: data)
			} else {
				self.presenter?.getImageFromURLFailure(quote: quote)
			}
		}
	}
}
