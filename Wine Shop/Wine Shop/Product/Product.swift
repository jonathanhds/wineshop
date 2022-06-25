import Foundation

let ALL_PRODUCTS_IDS = Set([
	"wine.cabernet-sauvignon",
	"wine.carmenere",
	"wine.malbec",
	"wine.merlot",
	"wine.tempranillo",
	"wine.pinot-noir",
	"wine.syrah",
	"wine.chardonnay",
	"wine.sauvignon-blanc"
])

struct Product: Identifiable {
	let id: String
	let name: String
	let description: String
	let thumbnailImage: String?
	let price: String
}

extension Product: CustomDebugStringConvertible {

	var debugDescription: String {
		"Product [id: \(id), name: \(name), description: \(description), price: \(price)]"
	}
}
