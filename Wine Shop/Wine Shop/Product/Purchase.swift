import Foundation

struct Purchase: Identifiable {
	let id = UUID()
	let product: Product
	let quantity: Int
	let date: Date
}
