import SwiftUI
import FirebaseFirestore

struct ListView: View {
    @StateObject var viewModel = ListViewVM()
    @FirestoreQuery var items: [ListItem]
    
    init(userId: String){
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
    }
    
    var body: some View {
        NavigationView {
            VStack{
                List(items) { item in
                    ListItemView(item: item)
                        .swipeActions {
                            Button("Delete"){
                                viewModel.delete(id: item.id)
                            }
                            .background(Color.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

#Preview {
    ListView(userId: "q6THBCN1kOetgV30Wla9eYhfW3r2")
}
