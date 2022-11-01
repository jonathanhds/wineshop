import SwiftUI

struct ProductsListView: View {
	
	@StateObject
	private var viewModel = ProductsListViewModel()
	
	var body: some View {
		Group {
			switch viewModel.state {
			case .empty:
				Text("No products found!")
			case .loading:
				LoadingView()
			case .error(let error):
				Text("**Failed to fetch products**\n\(error.localizedDescription)")
					.multilineTextAlignment(.center)
			case .data(let products):
				productsList(products)
			}
		}
		.navigationTitle("Products")
		.task {
			await viewModel.fetchAllProducts()
		}
	}
	
	private func productsList(_ products: [Product]) -> some View {
		List(products) { product in
			NavigationLink(destination: ProductDetailsView(product: product)) {
				ProductRowView(product: product)
			}
		}
	}
}

struct ProductsListView_Previews: PreviewProvider {
	static var previews: some View {
		TabView {
			NavigationView {
				ProductsListView()
			}
			.tabItem {
				Label("Products", systemImage: "cart")
			}
		}
	}
}
