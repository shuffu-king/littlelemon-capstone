//
//  MenuView.swift
//  Little Lemon
//
//  Created by Ayo Shafau on 4/16/24.
//

import SwiftUI

struct MenuView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var searchText = ""
    
    var body: some View {
        VStack {
            Text("Title")
                .font(.title)
            Text("Location")
            Text("description.....")
                .font(.caption)
            
            TextField("Search menu", text: $searchText)
                .textFieldStyle(.roundedBorder)
            
            FetchedObjects(predicate: buildPredicate(), sortDescriptors: buildSortDescriptors()) { (dishes: [Dish]) in
                List {
                    ForEach(dishes) {dish in
                        HStack {
                            Text(dish.title ?? "No dish")
                            Text(dish.price ?? "No dish")
                            AsyncImage(url: URL(string: dish.image ?? "")){ image in
                                image
                                    .image?
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            MenuList.getMenuData(viewContext: viewContext)
        }
         
    }
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
        return [NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedStandardCompare))]
    }
    
    func buildPredicate() -> NSPredicate {
        let predicate = searchText == "" ? NSPredicate(value: true) : NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        return predicate
    }
}

#Preview {
    MenuView().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
}
