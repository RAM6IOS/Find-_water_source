
//  AddForm.swift
//  source
//  Created by Bouchedoub Rmazi on 2/8/2022.
import SwiftUI
import CoreLocation
import CoreLocationUI
struct AddForm: View {
    let book : Locationse
    let formatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            return formatter
        }()
    @Environment(\.dismiss) var dismiss
    @State var name = ""
    @State private var photoData: Data?
    @State private var latitude = 0.0
    @State private var  longitude = 0.0
    @State private var shouldPresentPhotoPicker = false
    @State private var shownLocation = false
    @Environment(\.managedObjectContext) var moc
    @StateObject private var viewModel = locationManger()
    var body: some View {
        NavigationView{
        VStack{
                Button{
                    shouldPresentPhotoPicker.toggle()
                } label: {
                    
                    if let data = self.photoData, let image = UIImage.init(data: data) {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame( height: 200 )
                            .clipShape(Rectangle())
                            .cornerRadius(10)
                            .padding(.horizontal,10)
                    } else{
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .strokeBorder(lineWidth: 3)
                            Image(systemName: "camera")
                                .font(.largeTitle)
                        }
                        .frame(height: 200)
                        .padding(.horizontal,10)
                    }
                }
                .fullScreenCover(isPresented: $shouldPresentPhotoPicker) {
                    PhotoPickerView(photoData: $photoData)
                }
            Form{
                Section{
                TextField("name",text: $name)
                }
                Button{
                    withAnimation{
                    viewModel.requesAllowOnceLocationPermission()
                    shownLocation.toggle()
                    }
                } label: {
                    withAnimation{
                    HStack{
                    Text("Location")
                        Spacer()
                        Image(systemName: shownLocation ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill")
                    }
                    }
                }
                if shownLocation == true{
                Section( footer: Text("Location Coordinates Can be Changed Manually")){
                    TextField("longitude" , value: $viewModel.region.center.latitude, formatter: formatter)
                    TextField("longitude" , value: $viewModel.region.center.longitude , formatter: formatter)
                }
                }
                }
            Button{
                let newBook = Locationse(context: moc)
                newBook.id = UUID()
                newBook.name = name
                newBook.latitude = viewModel.region.center.latitude
                newBook.longitude =  viewModel.region.center.longitude
                newBook.photoData = photoData
                try? moc.save()
                shownLocation.toggle()
                name = ""
                dismiss()
            } label: {
                Text("Save")
                    .foregroundColor(Color.black)
                    .frame(width: 350, height: 50)
                    .background(Color.theme.accentcolor)
                    
            }
            .cornerRadius(30)
            }
        }
        }
    }
