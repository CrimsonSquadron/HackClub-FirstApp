//
//  ContentView.swift
//  FitnessDashBoard_SwiftUI
//
//  Created by Matthew Dudzinski on Feb 23, 2023
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            welcomeText()
            lastDay()
            Text("Status")
                .font(.system(size: 15, weight: .semibold, design: .rounded))
                .padding(.trailing, 320)
            fitnessInfo(fitData: fitnessData)
                .tag(0).overlay(addWidgets())
            Spacer()
            tabBar()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct welcomeText : View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Hello")
                .font(.system(size: 42, weight: .bold, design: .rounded))
            Text("Matthew")
                .font(.system(size: 40, weight: .bold, design: .rounded))
        }
        .padding(.top, 25)
        .padding(.trailing, 200)
    }
}

struct lastDay : View {
    var body: some View {
        HStack(spacing: 5) {
            Image(systemName: "info.circle")
                .resizable()
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .frame(width: 20, height: 20, alignment: .leading)
                .foregroundColor(.black)
                .padding()
            
            Text("Current Status of Mac.")
                .font(.system(size: 12, weight: .semibold, design: .rounded))
                .foregroundColor(.black)
                .layoutPriority(1)
                .lineLimit(1)
                .padding()
        }
        .background(Color.gray.opacity(0.2))
        .clipShape(Rectangle())
        .cornerRadius(20)
        .padding()
    }
}


struct fitnessInfo: View {
    
    var fitData : [Fitness]
    var columns = Array(repeating: GridItem(.flexible(), spacing: 5), count: 2)
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 30) {
            ForEach(fitData) {fitness in
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                    VStack(alignment: .leading, spacing: 25) {
                        Text(fitness.title)
                            .foregroundColor(.white)
                        Text(fitness.data)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.top, 10)
                        Text(fitness.suggest)
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(Color(fitness.image))
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                }
            }
        }
        .frame(width: 350, height: 350)
        .padding(.horizontal, 10)
        .padding(.top, 45)
    }
}

struct Fitness : Identifiable {
    var id: Int
    var title: String
    var image: String
    var data: String
    var suggest: String
}

var fitnessData = [

    Fitness(id: 0, title: "CPU", image: "heart", data: "67%", suggest: "Stable in current use"),
    Fitness(id: 1, title: "RAM", image: "running", data: "4.5 GB used", suggest: "Buy more RAM"),
    Fitness(id: 2, title: "Storage", image: "cycle", data: "128 out of 256GB used", suggest: "Buy more Storage"),

]

struct addWidgets : View {
    var body: some View {
        HStack(spacing: 5) {
            Text("+ Add Widgets")
                .font(.system(size: 12, weight: .semibold, design: .rounded))
                .foregroundColor(.black)
                .layoutPriority(1)
                .lineLimit(2)
                .padding()
        }
        .background(Color.gray.opacity(0.2))
        .clipShape(Rectangle())
        .cornerRadius(10)
        .padding()
        .padding(.leading, 170)
        .padding(.top, 130)
    }
}

struct tabBar : View {
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: "macpro.gen1")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(Color("running"))
                .padding(20)
            
            Image(systemName: "memorychip")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(Color.white)
                .padding(20)
            
            Image(systemName: "plus")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(Color.white)
                .padding(20)
            
            Image(systemName: "display")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(Color.white)
                .padding(20)
            
            Image(systemName: "externaldrive")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(Color.white)
                .padding(20)
        }
        .background(Color.black.opacity(0.6))
        .clipShape(Rectangle())
        .cornerRadius(25)
        .padding()
    }
}
