import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            EnterView()
        }
    }
}

struct EnterView: View {
    @State private var onboardingState: Int? = nil

    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), center: .topLeading, startRadius: 5, endRadius: UIScreen.main.bounds.height)
                .ignoresSafeArea(.all)

            VStack(spacing: 10) {
                Text("Начни работу прямо сейчас")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
  
                
                
                Spacer()

                NavigationLink(destination: RefistationView().navigationBarBackButtonHidden(true), tag: 1, selection: $onboardingState) {
                    bottomRegistration
                }

                NavigationLink(destination: LoginView(), tag: 2, selection: $onboardingState) {
                    bottomEnter
                }
            }
            .padding()
        }
    }
}

struct RegistrationView: View {
    var body: some View {
        VStack {
            Text("Это экран регистрации")
                .padding()
            Spacer()
        }
    }
}

struct LoginView: View {
    var body: some View {
        Text("Это экран входа")
            .padding()
    }
}

extension EnterView {
    private var bottomRegistration: some View {
        Text("Регистрация")
            .font(.headline)
            .foregroundColor(.purple)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(10)
            .onTapGesture {
                onboardingState = 1
            }
    }

    private var bottomEnter: some View {
        Text("Войти")
            .font(.headline)
            .foregroundColor(.purple)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(10)
            .onTapGesture {
                onboardingState = 2
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
