import SwiftUI

struct MathExampleView: View {
    private let multiplicand = Int.random(in: 1 ... 12)
    private let factor = "5"
    
    var body: some View {
        HStack {
            ZStack {
                RandomShapesView()
                
                Text(factor)
            }
            
            ZStack {
                Circle()
                    .fill(Color.black)
                    .frame(width: 70, height: 70)
                
                Text("x")
            }
            
            HStack {
                if multiplicand >= 10 {
                    ZStack {
                        RandomShapesView()
                        
                        Text("1")
                    }
                    
                    ZStack {
                        RandomShapesView()
                        
                        Text(multiplicand == 10 ? "0" : (multiplicand == 11 ? "1" : "2"))
                    }
                } else {
                    ZStack {
                        RandomShapesView()
                        
                        Text("\(multiplicand)")
                    }
                }
            }
        }
    }
}

struct MathExampleView_Previews: PreviewProvider {
    static var previews: some View {
        MathExampleView()
    }
}
