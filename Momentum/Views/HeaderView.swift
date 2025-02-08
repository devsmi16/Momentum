import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let angle: Double
    let backgroundColor: Color
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(backgroundColor)
                .rotationEffect(Angle(degrees: angle))
                .frame(height: 350)
            
            VStack(spacing: 10){
                Text(title)
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .bold()
                
                Text(subtitle)
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
                    .lineLimit(2)
                    .minimumScaleFactor(0.5)
            }
            .padding(.top, 80)
            .padding(.horizontal, 20)
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 350)
        .offset(y: -100)
    }
}

#Preview {
    HeaderView(title: "title",
               subtitle: "subtitle",
               angle: 15,
               backgroundColor: .green)
}
