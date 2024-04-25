//
//  MenuList.swift
//  Little Lemon
//
//  Created by Ayo Shafau on 4/20/24.
//

import Foundation
import CoreData

struct MenuList: Codable {
    let menu: [MenuItem]
    
    enum CodingKeys: String, CodingKey {
        case menu = "menu"
    }
    
    static func getMenuData(viewContext: NSManagedObjectContext) {
        PersistenceController.shared.clear()
        
        let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")!
        let request = URLRequest(url: url)
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data  {
                let decoder = JSONDecoder()
                if let jsonMenu = try? decoder.decode(MenuList.self, from: data) {
                    for dish in jsonMenu.menu {
                        let newDish = Dish(context: viewContext)
                        newDish.title = dish.title
                        newDish.image = dish.image
                        newDish.price = dish.price
                    }
                    try? viewContext.save()
                } else {
                    print(error.debugDescription.description)
                }
            } else {
                print(error.debugDescription.description)
            }
        }
        
        dataTask.resume()
    }
}
