//
//  ContentView.swift
//  Shared
//
//  Created by Ryan Lee on 6/29/20.
//

import SwiftUI

struct Message: Identifiable {
    var id = UUID()
    var message: String
    var sender: String
    var time: String
}

let testData = [
    Message(message: "Hello", sender: "Ryan Lee", time: "7:45 PM"),
    Message(message: "Hey, what's up?", sender: "Derek Moring", time: "6:00 PM"),
    Message(message: "Hey dude, let's chill.", sender: "Robert Garlock", time: "11:22 AM")
]


struct ContentView: View {
    var message: [Message] = []
    var text = "text"
    
    var body: some View {
        VStack {
            HStack{
                Text("Edit")
                    .font(.title3)
                    .foregroundColor(.blue)
                Spacer()
                Image(systemName: "square.and.pencil")
                    .resizable()
                    .frame(width:25, height: 25)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            }
            .padding(10)
            VStack {
                HStack {
                    Text("Messages")
                        .font(.largeTitle)
                        .bold()
                        .padding(.bottom, -20)
                        .padding(.leading, 10)
                    Spacer()
                }
                HStack{
                    Image(systemName: "magnifyingglass")
                        .padding(.leading)
                        .padding(.top, 10)
                        .padding(.bottom, 10)
                    Text("Search")
                    Spacer()
                    Image(systemName:"mic.fill")
                        .padding(.trailing)
                }
                .foregroundColor(.secondary)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .padding(10)
            }
            NavigationView {
                List {
                    ForEach(message) {message in
                    MessageCell(message: message)
                    }
                    Spacer()
                }
                .navigationBarHidden(true)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(message: testData)
        }
    }
}

struct MessageCell: View {
    var message: Message
    var body: some View {
        HStack {
            Image(systemName: "person.crop.circle")
                .resizable()
                .frame(width: 50, height: 50)
                .padding(2)
            
            
            VStack(alignment: .leading) {
                Text(message.sender)
                    .font(.headline)
                Text(message.message)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
            VStack{
                HStack {
                    Text(message.time)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Image(systemName: "chevron.right")
                        .foregroundColor(.secondary)
                }
                Spacer()
            }
        }
    }
}
