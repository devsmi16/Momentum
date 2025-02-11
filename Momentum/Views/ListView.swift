import SwiftUI
import FirebaseFirestore

struct ListView: View {
    @StateObject var viewModel: ListViewVM
    @FirestoreQuery var items: [ListItem]
    
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: ListViewVM(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ListItemView(item: item)
                        .swipeActions {
                            Button(action: {
                                viewModel.delete(id: item.id)
                            }) {
                                Label("Delete", systemImage: "trash.fill")
                            }
                            .tint(.red)
                        }
                        .padding(.vertical, 5)
                }
                .listStyle(InsetGroupedListStyle())
                
                Spacer()
            }
            .navigationTitle("To Do List")
            .navigationBarTitleDisplayMode(.inline)
            .font(.system(size: 20, weight: .medium))
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        viewModel.showingNewItemView = true
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                            .foregroundColor(.green) 
                    }
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
            .padding(.horizontal) // Ensures there's padding on both sides of the screen
        }
    }
}

#Preview {
    ListView(userId: "q6THBCN1kOetgV30Wla9eYhfW3r2")
}
