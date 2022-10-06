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

let ALL_SUBSCRIPTIONS_IDS = Set([
	"wine-shop.plus",
	"wine-shop.pro"
])

struct Product: Identifiable {
	let id: String
	let name: String
	let description: String?
	let thumbnailImage: String?
	let price: String
}

extension Product: CustomDebugStringConvertible {
	var debugDescription: String {
		"Product [id: \(id), name: \(name), description: \(description ?? "nil"), price: \(price)]"
	}
}

#if DEBUG
extension Product {
	static let cabernetSauvignon = Product(id: "1",
																				 name: "Cabernet Sauvignon",
																				 description: "",
																				 thumbnailImage: nil,
																				 price: "US$ 9,99")

	static let wineShopPlus = Product(id: "2",
																		name: "Wine Shop Plus",
																		description: nil,
																		thumbnailImage: nil,
																		price: "US$ 9,99")

}
#endif
