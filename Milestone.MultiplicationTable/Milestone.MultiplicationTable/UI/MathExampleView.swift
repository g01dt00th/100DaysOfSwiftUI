import SwiftUI

struct MathExampleView: View {
    @EnvironmentObject var device: NumPad
    
    var body: some View {
        HStack {
            ZStack {
                RandomShapesView()
                
                Text("\(device.numPad.factor)")
            }
            
            ZStack {
                Circle()
                    .fill(Color.black)
                    .frame(width: 70, height: 70)
                
                Text("x")
            }
            
            HStack {
                if device.numPad.multiplicand >= 10 {
                    ZStack {
                        RandomShapesView()

                        Text("1")
                    }

                    ZStack {
                        RandomShapesView()

                        Text(device.numPad.multiplicand == 10 ? "0" : (device.numPad.multiplicand == 11 ? "1" : "2"))
                    }
                } else {
                    ZStack {
                        RandomShapesView()

                        Text("\(device.numPad.multiplicand)")
                    }
                }
            }
        }
    }
}

struct MathExampleView_Previews: PreviewProvider {
    static let device = NumPad()
    
    static var previews: some View {
        MathExampleView().environmentObject(device)
    }
}
