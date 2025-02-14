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
                        .padding(.vertical, 8)
                }
                .listStyle(InsetGroupedListStyle())
                .background(Color(UIColor.systemBackground))
                .cornerRadius(10)
                .shadow(radius: 5)
                Spacer()
            }
            .navigationTitle("Conquer Your Day")
            .navigationBarTitleDisplayMode(.inline)
            .font(.system(size: 10, weight: .medium))
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        withAnimation {
                            viewModel.showingNewItemView = true
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 20))
                            .foregroundColor(.mint)
                            .padding(0)
                            .shadow(radius: 10, x: 5, y: 5)
                            .scaleEffect(viewModel.showingNewItemView ? 2.6 : 1.2)
                            .animation(.easeInOut(duration: 0.1), value: viewModel.showingNewItemView)
                    }
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
            .padding(.horizontal, 16)
            .background(Color(UIColor.secondarySystemBackground))
        }
    }
}

#Preview {
    ListView(userId: "q6THBCN1kOetgV30Wla9eYhfW3r2")
}
