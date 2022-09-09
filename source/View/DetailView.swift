
//  Created by Bouchedoub Rmazi on 30/6/2022.
import SwiftUI
import CoreData
struct DetailView: View {
    @FetchRequest(sortDescriptors: []) var locatons: FetchedResults<Locationse>
    @Environment(\.managedObjectContext) var moc
    @State private var name = " "
    var body: some View {
        NavigationView{
            VStack{
            List{
                        ForEach(locatons){ locaton in
                            HStack{
                            if let photoData = locaton.photoData, let uiImage = UIImage(data: photoData) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .scaledToFill()
                                    .clipShape(Circle())
                                    .frame(width: 50, height: 50)
                            }
                            VStack{
                            Text(locaton.name ?? "dsabbsd")
                                    .font(.headline)
                                    .padding(.vertical,5)
                                VStack{
                            Text("Latitude: \(locaton.latitude) ")
                            Text("Longitude:\(locaton.longitude) ")
                                }
                            }
                            .padding(.horizontal , 10)
                            
                            }
                        }
                        .onDelete(perform: deleteBooks)
            }
            }
        }
    }
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            let book = locatons[offset]
            moc.delete(book)
        }
        try? moc.save()
    }
}
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
