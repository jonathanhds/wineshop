import SwiftUI

struct ProductDetailsView: View {

	let product: Product

	var body: some View {
		ScrollView {
			VStack(spacing: 20) {
				Group {
					if let thumbnailImage = product.thumbnailImage {
						Image(thumbnailImage)
					} else {
						Image("wine")
							.resizable()
							.aspectRatio(1.0, contentMode: .fit)
					}
				}

				if let description = product.description {
					VStack(alignment: .leading) {
						Text("Description")
							.font(.headline)
						Text(description)
					}
				}

				Text(product.price)
					.font(.caption)

				Button(action: {

				}, label: {
					Label("Buy", systemImage: "cart")
				})
				.frame(width: 300)
				.buttonStyle(.bordered)
				.controlSize(.large)
				.tint(.accentColor)
			}
			.padding([.leading, .trailing])
		}
		.navigationTitle(product.name)
	}
}

struct ProductDetailsView_Previews: PreviewProvider {
	static var previews: some View {
		NavigationView {
			ProductDetailsView(product: Product(id: "2",
												name: "Carménère",
												description: "",
												thumbnailImage: nil,
												price: "US$ 11,00"))
		}
	}
}
