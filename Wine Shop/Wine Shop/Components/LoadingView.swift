import SwiftUI

struct LoadingView: View {
	var body: some View {
		ProgressView("Loading...")
	}
}

struct LoadingView_Previews: PreviewProvider {
	static var previews: some View {
		LoadingView()
	}
}
