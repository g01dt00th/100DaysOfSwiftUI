import SwiftUI

struct MathSolutionView: View {
    @EnvironmentObject var device: NumPad
    
    var body: some View {
        HStack {
            ForEach(0 ..< self.device.numPad.solution.count, id: \.self) { item in
                ZStack {
                    RandomShapesView()
                    
                    Text(String(Array(self.device.numPad.solution)[item]))
                }
            }
        }
        .animation(Animation.easeOut)
    }
}

struct MathSolutionView_Previews: PreviewProvider {
    static let device = NumPad()
    
    static var previews: some View {
        MathSolutionView().environmentObject(device)
    }
}
