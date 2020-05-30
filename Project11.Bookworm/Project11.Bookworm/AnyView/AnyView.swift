import SwiftUI

struct AnyView: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    
    var body: some View {
        if sizeClass == .compact {
            return HStack {
                Text("Active size class:")
                Text("COMPACT")
            }
            .font(.largeTitle)
        } else {
            return HStack {
                Text("Active size class:")
                Text("REGULAR")
            }
            .font(.largeTitle)
        }
    }
}

struct AnyView_Previews: PreviewProvider {
    static var previews: some View {
        AnyView()
    }
}
