import SwiftUI

struct SplashView: View {
    @State private var isActive = false

    var body: some View {
        VStack {
            Image("SplashScreen")   .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.isActive = true
            }
        }
        .fullScreenCover(isPresented: $isActive) {
            CharactersView()
        }
    }
}

#Preview {
    SplashView()
}
