import SwiftUI

struct ToggleImageButton: View {
    @Binding var isImageVisible: Bool

    var body: some View {
        Button(action: {
            isImageVisible.toggle()
        }) {
            Text("Toggle Image")
        }
        .padding()
    }
}

struct ee: View {
    @State private var text1: String = ""
    @State private var text2: String = ""
    @State private var isImageVisible: Bool = false
    @State private var isDetailViewActive: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                TextField("TextField 1", text: $text1)
                    .padding()
                    .onTapGesture {
                        isImageVisible = false
                    }
                    .onChange(of: text1) { _ in
                        isImageVisible = false
                    }

                TextField("TextField 2", text: $text2)
                    .padding()
                    .onTapGesture {
                        isImageVisible = false
                    }
                    .onChange(of: text2) { _ in
                        isImageVisible = false
                    }

                ToggleImageButton(isImageVisible: $isImageVisible)

                NavigationLink(destination: DetailView(), isActive: $isDetailViewActive) {
                    EmptyView()
                }
                //.hidden()
                .onTapGesture {
                    isImageVisible = false
                    isDetailViewActive = true
                }

                if isImageVisible {
                    Image(systemName: "square.and.arrow.down.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                        .onTapGesture {
                            isImageVisible = false
                        }
                }
            }
            .padding()
            .navigationBarTitle("Demo")
        }
    }
}

struct DetailView: View {
    var body: some View {
        Text("Detail View")
            .padding()
    }
}

struct ee_Previews: PreviewProvider {
    static var previews: some View {
        ee()
    }
}
