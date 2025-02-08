import SwiftUI

struct TLButton: View {
    
    let title: String
    let backgroundColor: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .frame(maxWidth: .infinity, minHeight: 50)
                .background(backgroundColor.gradient)
                .foregroundColor(.white)
                .cornerRadius(12)
                .shadow(color: backgroundColor.opacity(0.3), radius: 5, x: 0, y: 5)
        }
        .padding(.horizontal)
    }
}

#Preview {
    TLButton(title: "Click Me", backgroundColor: .blue, action: {})
}
