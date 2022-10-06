import SwiftUI

struct SubscriptionContentView: View {

	let subscription: Product

	var body: some View {
		HStack {
			VStack(alignment: .leading, spacing: 8) {
				Text(subscription.name)
					.font(.title)
					.fixedSize(horizontal: false, vertical: true)

				if let description = subscription.description {
					Text(description)
						.font(.caption)
				}
			}

			if let thumbnailImage = subscription.thumbnailImage {
				Image(thumbnailImage)
					.resizable()
					.frame(width: 100, height: 100)
			}
		}
		.padding()
	}
}

struct SubscriptionContentView_Previews: PreviewProvider {
	static var previews: some View {
		SubscriptionContentView(subscription: .wineShopPlus)
			.previewLayout(.sizeThatFits)
	}
}
