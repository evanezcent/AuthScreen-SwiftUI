//
//  ContentView.swift
//  LoginApp
//
//  Created by Pratama Yoga on 09/04/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
            // for light status bar
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View{
        GeometryReader{_ in
            
            VStack{
                Image("logo")
                    .resizable()
                    .frame(width: 60, height: 60)
                
                VStack{
                    HStack{
                        Text("Login")
                            .foregroundColor(.white)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        
                        Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                    }
                    .padding(.top, 40)
                    
                    VStack{
                        HStack(spacing:15){
                            Image(systemName: "envelope.fill")
                                .foregroundColor(Color("PrimaryColor"))
                            
                            TextField("Email Address", text:self.$email)
                        }
                        
                        Divider().background(Color.white.opacity(0.5))
                    }
                }
                .padding()
                .background(Color("SecondaryColor"))
                .padding(.horizontal, 20)
            }
        }
        .background(Color("BackgroundColor").edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/))
    }
}
