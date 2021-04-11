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
    
    var body: some View{
        GeometryReader {geo in
            
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
                Image("logo")
                    .resizable()
                    .frame(width: 60, height: 60)
                
                // Box login
                RegisterFormView()
            }
        }
        .background(Color("BackgroundColor").edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/))
    }
}

struct TriangleSlice: Shape {
    func path(in rect: CGRect) -> Path {
        return Path{path in
            // right side curve
            path.move(to: CGPoint(x: rect.width,y: 100))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: 0))
        }
    }
}

struct TriangleSliceRegister: Shape {
    func path(in rect: CGRect) -> Path {
        return Path{path in
            // right side curve
            path.move(to: CGPoint(x: 0,y: 100))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
        }
    }
}

// Login Form
struct LoginFormView: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            VStack{
                HStack{
                    Text("Login")
                        .foregroundColor(.white)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    
                    Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                }
                .padding(.top, 40)
                
                // EMAIL
                VStack{
                    HStack(spacing:15){
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color("PrimaryColor"))
                        
                        TextField("Email Address", text:self.$email)
                    }
                    
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 40)
                
                // PASSWORD
                VStack{
                    HStack(spacing:15){
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color("PrimaryColor"))
                        
                        SecureField("Password", text:self.$password)
                    }
                    
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 20)
                
                // Forgot password
                HStack{
                    Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Text("Forgot password ?")
                            .foregroundColor(Color.white.opacity(0.6))
                    }
                }
                .padding(.horizontal)
                .padding(.top, 20)
            }
            .padding()
            // bottom padding
            .padding(.bottom, 60)
            .background(Color("SecondaryColor"))
            
            .clipShape(TriangleSlice())
            .cornerRadius(35)
            .padding(.horizontal, 20)
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/){
                Text("LOGIN")
                    .foregroundColor(.white)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color("PrimaryColor"))
                    .clipShape(Capsule())
                    .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
                
            }
            .offset(y:25)
        }
    }
}

// Sign up Form
struct RegisterFormView: View {
    
    @State var email = ""
    @State var password = ""
    @State var confirm_password = ""
    @Binding var index: Int
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            VStack{
                HStack{
                    Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                    
                    VStack(spacing: 10) {
                        Text("Register")
                            .foregroundColor(self.index == 1 ? .white : .gray)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        
                        Capsule()
                            .fill(self.index == 1 ? Color.blue : Color.clear)
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 5)
                    }
                    
                }
                .padding(.top, 40)
                
                // EMAIL
                VStack{
                    HStack(spacing:15){
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color("PrimaryColor"))
                        
                        TextField("Email Address", text:self.$email)
                    }
                    
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 40)
                
                // PASSWORD
                VStack{
                    HStack(spacing:15){
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color("PrimaryColor"))
                        
                        SecureField("Password", text:self.$password)
                    }
                    
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 20)
                
                // Confirm PASSWORD
                VStack{
                    HStack(spacing:15){
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color("PrimaryColor"))
                        
                        SecureField("Confirm Password", text:self.$confirm_password)
                    }
                    
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 20)
            }
            .padding()
            // bottom padding
            .padding(.bottom, 60)
            .background(Color("SecondaryColor"))
            .clipShape(TriangleSliceRegister())
            // clipping the content shape for gesture
            .contentShape(TriangleSliceRegister())
            .cornerRadius(35)
            .padding(.horizontal, 20)
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/){
                Text("REGISTER")
                    .foregroundColor(.white)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color("PrimaryColor"))
                    .clipShape(Capsule())
                    .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
                
            }
            .offset(y:25)
            // hides view when in background
            // only button
            .opacity(self.index == 1 ? 1 : 0)
        }
    }
}
