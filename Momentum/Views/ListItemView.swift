import SwiftUI

struct ListItemView: View {
    @StateObject var viewModel = ProfileViewVM()
    let item: ListItem
    var body: some View {
        HStack{
            
            VStack(alignment: .leading){
                Text(item.title)
                    .font(.body)
                
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.headline)
                    .foregroundColor(.teal)
            }
            Spacer()
            
            Button{
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
            }
            
        }
    }
}

#Preview {
    ListItemView(item: .init(id: "16",
                             title: "Book",
                             dueDate: Date().timeIntervalSince1970,
                             createdDate: Date().timeIntervalSince1970,
                             isDone: false))
}
