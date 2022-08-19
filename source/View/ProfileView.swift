//
//  ProfileView.swift
//  source
//
//  Created by Bouchedoub Rmazi on 13/8/2022.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView{
            VStack{
                ZStack{
                    Image("default-avatar")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 100 )
                        .clipShape(Circle())
                   
                    Image(systemName: "square.and.pencil")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 17, height: 17)
                        .foregroundColor(.black)
                        .offset(y:40)
                }
                List{
                    Section{
                    Text("name")
                    Text("Email")
                    }
                }
                VStack{
                    Button{
                        
                    } label: {
                        Text("Edit")
                            .bold()
                            .font(.title3)
                            .frame(width: 250, height: 40)
                            .foregroundColor(.white)
                    }
                    .background(Color.theme.twilightWhite)
                    .cornerRadius(10)
                    Button{
                        
                    } label: {
                        Text("Logout")
                            .bold()
                            .font(.title3)
                            .frame(width: 250, height: 40)
                            .foregroundColor(.white)
                    }
                    .background(Color.theme.accentcolor)
                    .cornerRadius(10)
                    Button{
                        
                    } label: {
                        Text("Delete Account")
                            .bold()
                            .font(.title3)
                            .frame(width: 250, height: 40)
                            .foregroundColor(.black)
                    }
                    .border(Color.theme.twilightWhite, width: 2)
                    .cornerRadius(10)
                    
                }
                
            }
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
