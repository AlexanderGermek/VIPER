//
//  ImageDataService.swift
//  VIPER
//
//  Created by iMac on 28.11.2021.
//

import UIKit

final class ImageDataService {

	static let shared = ImageDataService()
	private init() { }

	func convertToUIImage(from data: Data) -> UIImage? {
		return UIImage(data: data)
	}
}
