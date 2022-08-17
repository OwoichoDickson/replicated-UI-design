//
//  ContentView.swift
//  netflix clone
//
//  Created by Emmanuel Dicksson on 16/08/2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.9606344104, green: 0.9039988518, blue: 0.9287932515, alpha: 1)).edgesIgnoringSafeArea(.all
            )
            VStack {
                
                Header()
                    .padding(.vertical ,20)
                Search()
                    .padding(.vertical ,20)
                Buttons()
                    .padding(.vertical ,20)
                Cards()
                    .padding(.top, 0)
                
                Taskbar()
                    .offset(y:50)
                
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
//MARK: Header
struct Header: View {
    var body: some View {
        HStack {
            
            VStack (alignment:.leading){
                Text("Good Morning,")
                    .font(.system(size: 17,weight:.medium, design: .serif))
                    .foregroundColor(.pink)
                Text("Shaileen!")
                    .font(.system(size: 24,weight:.medium, design: .serif))
                    .foregroundColor(.pink)
            }
            Spacer()
            Image("profile")
            
                .resizable()
                .frame(width: 40, height:40)
            
        }
        .padding(.horizontal, 30)
    }
}

//MARK: Search
struct Search: View {
    var body: some View {
        HStack{
            Text("Search for 3D products")
                .foregroundColor(.gray)
                .font(.system(size: 13))
                .padding(.leading, 40 )
            Image(systemName: "magnifyingglass")
                .foregroundColor(.pink)
                .padding(.leading)
                .font(.system(size: 13))
                
        }
        .padding(.top, 5)
        .frame(width: 350, height: 60)
        .background(.white)
        .cornerRadius(16)
    }
}

struct Buttons: View {
    var body: some View {
        HStack (spacing: 34){
            VStack{
                VStack{Image(systemName: "clock")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                    
                }
                .frame(width: 50, height: 50)
                .background(.pink )
                .cornerRadius(5)
                .padding(.top, 5)
                
                Text("Recent")
                    .font(.system(size: 10,weight: .bold, design:.serif ))
                    .foregroundColor(.pink)
                    .padding(.trailing, 5)
            }
            VStack{
                VStack{Image(systemName: "flame")
                        .font(.system(size: 20))
                        .foregroundColor(.gray)
                    
                }
                .frame(width: 50, height: 50)
                .background(.white)
                .cornerRadius(5)
                .padding(.top, 5)
                
                Text("Trending")
                    .font(.system(size: 10, weight: .bold, design:.serif ))
                    .foregroundColor(.gray)
                    .padding(.trailing, 5)
            }
            VStack{
                VStack{Image(systemName: "crown")
                        .font(.system(size: 20))
                        .foregroundColor(.gray)
                    
                }
                .frame(width: 50, height: 50)
                .background(.white)
                .cornerRadius(5)
                .padding(.top, 5)
                
                Text("Popular")
                    .font(.system(size: 10,weight: .bold, design:.serif ))
                    .foregroundColor(.gray)
                    .padding(.trailing, 5)
            }
            VStack{
                VStack{Image(systemName: "diamond")
                        .font(.system(size: 20))
                        .foregroundColor(.gray)
                    
                }
                .frame(width: 50, height: 50)
                .background(.white)
                .cornerRadius(5)
                .padding(.top, 5)
                
                Text("premium")
                    .font(.system(size: 10,weight: .bold, design:.serif ))
                    .foregroundColor(.gray)
                    .padding(.trailing, 5)
            }
        }
    }
}
//MARK: Cards
struct Cards: View {
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text("Recommended products")
                    .font(.system(size: 19,weight:.medium, design: .serif))
                    .fontWeight(.bold)
                    .foregroundColor(.pink)
                    .padding([.top, .leading], 18.0)
                
                
                ScrollView(.horizontal) {
                    HStack(spacing: 35){
                        
                        VStack(alignment: .leading){
                            Image("Geometery")
                                .resizable()
                            VStack(alignment: .leading){
                                Text("Love Undefined")
                                    .font(.system(size: 14,weight:.medium, design: .serif))
                                    .foregroundColor(.pink)
                                    .multilineTextAlignment(.leading)
                                    .padding(.horizontal, 7.0)
                                Text("Love Undefined and lost does not cost much pain especially the love of God unlike the love of man"
                                        )
                                
                                    .font(.system(size: 10,weight:.medium, design: .serif))
                                    .fontWeight(.regular)
                                    .foregroundColor(.pink)
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(3)
                                    .padding(.top,1)
                                    .padding(.horizontal,5)
                                    .padding(.bottom,15)
                                
                                
                            }
                            
                        }
                        
                        .frame(width: 200, height: 250)
                        .background(.white)
                        .cornerRadius(20)
                        
                        VStack{
                            Image("Geometery")
                                .resizable()
                            VStack(alignment: .leading){
                                Text("Love Undefined")
                                    .font(.system(size: 14,weight:.medium, design: .serif))
                                    .foregroundColor(.pink)
                                    .multilineTextAlignment(.leading)
                                    .padding(.horizontal, 5)
                                Text("Love Undefined and lost does not cost much pain especially the love of God unlike the love of man")
                                
                                    .font(.system(size: 10,weight:.medium, design: .serif))
                                    .fontWeight(.regular)
                                    .foregroundColor(.pink)
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(3)
                                    .padding(.top,1)
                                    .padding(.horizontal,5)
                                    .padding(.bottom,15)
                                
                                
                            }
                            
                        }
                        
                        .frame(width: 200, height: 250)
                        .background(.white)
                        .cornerRadius(20)
                        
                    }
                    .padding(.leading, 20)
                    .padding(.top)
                }
            }
        }
    }
}
//MARK: Taskbar
struct Taskbar: View {
    var body: some View {
        HStack(spacing: 70){
            VStack{
                Image(systemName: "house")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                Circle()
                    .frame(width: 6, height: 6)
                    .foregroundColor(.white)
                
            }
            .padding(.bottom, 15)
            VStack{
                Image(systemName: "heart")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                Circle()
                    .frame(width: 6, height: 6)
                    .foregroundColor(.white)
                    .opacity(0)
                
            }
            .padding(.bottom, 15)
            VStack{
                Image(systemName: "cube")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                Circle()
                    .frame(width: 6, height: 6)
                    .foregroundColor(.white)
                    .opacity(0)
                
            }
            .padding(.bottom, 15)
            VStack{
                Image(systemName: "person")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                Circle()
                    .frame(width: 6, height: 6)
                    .foregroundColor(.white)
                    .opacity(0)
                
            }
            .padding(.bottom, 15)
            
            
        }
        .frame( height: 80)
        .frame(maxWidth: .infinity)
        .background(.pink)
        .cornerRadius(25)
    }
}
