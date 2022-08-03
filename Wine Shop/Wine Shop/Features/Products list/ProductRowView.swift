import SwiftUI

struct ProductRowView: View {

	private static let PLACEHOLDER_IMAGE = "wine"

	let product: Product

	var body: some View {
		HStack {
			Image(product.thumbnailImage ?? Self.PLACEHOLDER_IMAGE)
				.resizable()
				.frame(width: 50, height: 50)

			VStack(alignment: .leading) {
				Text(product.name)
			}

			Spacer()

			Text(product.price)
				.font(.caption)
		}
		.frame(height: 50)
		.accessibilityLabel("\(product.name), \(product.price)")
	}
}

struct ProductRowView_Previews: PreviewProvider {
	static var previews: some View {
		Group {
			ProductRowView(product: Product(id: "1",
											name: "Cabernet Sauvignon",
											description: "",
											thumbnailImage: nil,
											price: "US$ 9,99"))
		}
		.previewLayout(.fixed(width: 400, height: 50))
	}
}
