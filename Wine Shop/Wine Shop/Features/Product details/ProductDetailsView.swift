import SwiftUI

struct ProductDetailsView: View {

	let viewModel: ProductDetailsViewModel

	var body: some View {
		ScrollView {
			VStack(spacing: 20) {
				Group {
					if let thumbnailImage = viewModel.thumbnailImage {
						Image(thumbnailImage)
					} else {
						Image("wine")
							.resizable()
							.aspectRatio(1.0, contentMode: .fit)
					}
				}

				if let description = viewModel.description {
					VStack(alignment: .leading) {
						Text("Description")
							.font(.headline)
						Text(description)
					}
				}

				Text(viewModel.price)
					.font(.caption)

				Button(action: {
					Task {
						await viewModel.buy()
					}
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
		.navigationTitle(viewModel.name)
	}
}

struct ProductDetailsView_Previews: PreviewProvider {
	static var previews: some View {
		NavigationView {
			ProductDetailsView(viewModel: .init(product: Product(id: "2",
																 name: "Carménère",
																 description: "",
																 thumbnailImage: nil,
																 price: "US$ 11,00")))
		}
	}
}
