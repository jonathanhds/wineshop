import SwiftUI

struct PurchaseRowView: View {

	let purchase: Purchase

	var body: some View {
		HStack {
			Text(purchase.product.name)

			Spacer()

			Text(purchase.date, style: .date)
				.font(.caption2)
		}
	}
}

struct PurchaseRowView_Previews: PreviewProvider {
	static var previews: some View {
		Group {
			PurchaseRowView(purchase: .init(product: .cabernetSauvignon,
											quantity: 2,
											date: .now)
			)
		}
		.previewLayout(.fixed(width: 400, height: 50))
	}
}
