//
//  QuoteDetailViewController.swift
//  VIPER
//
//  Created by iMac on 25.11.2021.
//

import UIKit
import EasyPeasy

final class QuoteDetailViewController: UIViewController {
	//MARK: Properties
	var presenter: ViewToPresenterQuoteDetailProtocol?

	private lazy var characterImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.contentMode = .scaleAspectFit
		return imageView
	}()

	private lazy var quoteLabel: UILabel = {
		let label = UILabel()
		label.numberOfLines = 0
		label.lineBreakMode = .byWordWrapping
		label.textAlignment = .center
		return label
	}()

	//MARK: Lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		addSubviews()
		presenter?.viewDidLoad()
	}

	private func addSubviews() {
		view.backgroundColor = .systemBackground
		view.addSubview(characterImageView)
		view.addSubview(quoteLabel)

		let widthHeightConstant = min(view.frame.width, view.frame.height)*0.8
		characterImageView.easy.layout(
			Top(150), CenterX(),
			Width(widthHeightConstant),
			Height(widthHeightConstant)
		)

		quoteLabel.easy.layout(
			Top().to(characterImageView),
			CenterX(),
			Width(widthHeightConstant),
			Bottom()
		)
	}
}

//MARK: PresenterToViewQuoteDetailProtocol
extension QuoteDetailViewController: PresenterToViewQuoteDetailProtocol {
	func onGetImageFromURLSuccess(_ quote: String, character: String, image: UIImage?) {
		print("View receives the success response from Presenter and updates itself.")
		quoteLabel.text = quote
		characterImageView.image = image == nil ? UIImage(systemName: "photo") : image
		title = character
	}

	func onGetImageFromURLSuccess(_ quote: String, character: String) {
		print("View receives the fail response from Presenter and updates itself.")
		quoteLabel.text = quote
		title = character
	}
}
