import SwiftUI

struct MathSolutionView: View {
    @ObservedObject var device: NumPad
    @Binding var solution: String
    
    var body: some View {
        HStack {
            ForEach(0 ..< solution.count, id: \.self) { item in
                ZStack {
                    RandomShapesView()
                    
                    Text(String(Array(self.solution)[item]))
                }
            }
        }
        .animation(Animation.easeOut)
    }
}

struct MathSolutionView_Previews: PreviewProvider {
    static var previews: some View {
        MathSolutionView(device: NumPad(num: NumPadData()), solution: .constant(""))
    }
}
