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
                            .foregroundColor(Color.white)
                            .frame(width: 350, height: 45)
                            
                    }
                    .background(Color.theme.twilightWhite)
                    .cornerRadius(30)
                    Button{
                        
                    } label: {
                        Text("Logout")
                            .bold()
                            .font(.title3)
                            .foregroundColor(.white)
                            .frame(width: 350, height: 45)
                    }
                    .background(Color.theme.accentcolor)
                    .cornerRadius(30)
                    ZStack{
                        ZStack {
                            RoundedRectangle(cornerRadius: 30 )
                                .strokeBorder( .blue,lineWidth: 3)
                            Button{
                                
                            } label: {
                                Text("Eidet")
                            }
                        }
                        .frame(width: 350, height: 45)
                        .padding(.horizontal,10)
                    }
                   
                  
                    
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
