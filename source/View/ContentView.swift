//
//  ContentView.swift
//  source
//
//  Created by Bouchedoub Rmazi on 9/4/2022.
//

import SwiftUI
import CoreData
import MapKit
import CoreLocation
import CoreLocationUI

struct ContentView: View {
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.latitude)
    ]) var locatons: FetchedResults<Locationse>
    @Environment(\.managedObjectContext) var moc
    let book : Locationse
    @State private var showingSheet = false
    @State private var showingForm = false
    @State private var refreshId = UUID()
    @StateObject private var viewModel = locationManger()
    var body: some View {
        ZStack(){
            Map(coordinateRegion: $viewModel.region ,showsUserLocation: true ,annotationItems: locatons) {location in
                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)){
                    VStack{
                       
                        if let photoData = location.photoData, let uiImage = UIImage(data: photoData) {
                            Image(uiImage: uiImage)
                               .resizable()
                                .scaledToFill()
                                .clipShape(Circle())
                                .frame(width: 50, height: 50)
                               
                        } else{
                            Button{
                                showingForm.toggle()
                            }label: {
                            Image("logo")
                                .resizable()
                               .scaledToFill()
                               .clipShape(Circle())
                                .frame(width: 50, height: 50)
                            }
                        }
                        Text(location.name ?? "nameLocation")
                        }
                
                }

            }
            
            .ignoresSafeArea()
            .accentColor(Color(.systemPink))
            Circle()
                    .fill(.red)
                    .opacity(0.3)
                    .frame(width: 32, height: 32)
            
            VStack {
                HStack{
                    Spacer()
                    Button {
                        showingSheet.toggle()
                        
                    } label: {
                        Image(systemName: "plus")
                    }
                    .padding()
                    .background(.black.opacity(0.75))
                    .foregroundColor(.white)
                    .font(.title)
                    .clipShape(Circle())
                    .padding(.trailing)
                }
                Spacer()
                HStack {
                    Spacer()
                    VStack{
                    Button {
                        
                        try? moc.save()
                        
                        
                        showingForm.toggle()
                        //dismiss()
                        
                    } label: {
                        Image(systemName: "plus")
                    }
                    .padding()
                    .background(.black.opacity(0.75))
                    .foregroundColor(.white)
                    .font(.title)
                    .clipShape(Circle())
                    .padding(.trailing)
                    .sheet(isPresented: $showingForm){
                        AddForm(book: book )
                    }
                    LocationButton(.currentLocation){
                            viewModel.requesAllowOnceLocationPermission()
                        }
                        .labelStyle(.iconOnly)
                        .foregroundColor(.white)
                        .font(.title)
                        .clipShape(Circle())
                        .padding(.trailing)
                }
                }
            }
        }
        .sheet(isPresented: $showingSheet) {
            DetailView()
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView( book: Locationse())
    }
}




