import SwiftUI

struct ContentView: View {

    @State private var redComponent: Double = 255
    @State private var greenComponent: Double = 128
    @State private var blueComponent: Double = 128
    @State private var alphaComponent: Double = 1.0

    private var resultingColor: Color {
        return Color(
            red: redComponent / 255.0,
            green: greenComponent / 255.0,
            blue: blueComponent / 255.0,
            opacity: alphaComponent
        )
    }

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Pré-visualização")) {
                    HStack {
                        Spacer()
                        Circle()
                            .fill(resultingColor)
                            .frame(width: 200, height: 200)
                            .overlay(
                                Text("Cor Resultante")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .blendMode(.difference)
                            )
                        Spacer()
                    }
                }

                Section(header: Text("Controles de Cor (RGBA)")) {
                    VStack(alignment: .leading) {
                        Text("Red: \(Int(redComponent))")
                        Slider(value: $redComponent, in: 0...255)
                            .accentColor(.red)
                    }.padding(.vertical, 4)

                    VStack(alignment: .leading) {
                        Text("Green: \(Int(greenComponent))")
                        Slider(value: $greenComponent, in: 0...255)
                            .accentColor(.green)
                    }.padding(.vertical, 4)

                    VStack(alignment: .leading) {
                        Text("Blue: \(Int(blueComponent))")
                        Slider(value: $blueComponent, in: 0...255)
                    }.padding(.vertical, 4)
                    

                    VStack(alignment: .leading) {
                        Text("Alpha: \(alphaComponent, specifier: "%.2f")")
                        Stepper(value: $alphaComponent, in: 0...1, step: 0.05) {
                            Text("Opacidade")
                        }
                    }.padding(.vertical, 4)
                }
            }
            .navigationTitle("Criador de Cores")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
