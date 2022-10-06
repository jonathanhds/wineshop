import SwiftUI

struct SubscriptionRowView: View {

	private let subscription: Product

	init(subscription: Product) {
		self.subscription = subscription
	}

	var body: some View {
		ZStack {
			Color.gray
				.cornerRadius(12)

			SubscriptionContentView(subscription: subscription)
		}
		.fixedSize(horizontal: false,
							 vertical: true)
		.shadow(color: .black.opacity(0.2),
						radius: 5,
						x: 0,
						y: 2)
	}
}

struct SubscriptionRowView_Previews: PreviewProvider {
	static var previews: some View {
		SubscriptionRowView(subscription: .wineShopPlus)
			.previewLayout(.sizeThatFits)
	}
}
