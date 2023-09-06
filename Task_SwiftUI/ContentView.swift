//
//  ContentView.swift
//  Task_SwiftUI
//
//  Created by vignesh kumar c on 06/09/23.
//

import SwiftUI

struct ContentView: View {
    @State private var currentPage = 0
    var body: some View {
        ScrollView {
            VStack {
                HeaderView()
                BurgerImageView()
                PageControl(numberOfPages: 3, currentPage: $currentPage)
                TitleView()
                Spacer(minLength: 30)
                IngredientsView()
                DescriptionView()
                    .frame(width: 380)
                Spacer(minLength: 20)
                ButtonBackgroundView(viewSize:  CGSize(width: 150, height: 50))
                Spacer()
            }
            .padding()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HeaderView: View {
    var body: some View {
        HStack {
            Button {
            } label: {
                Image("back")
                    .padding(.leading, 16)
            }
            Spacer()
            Text("Details")
            Spacer()
            Button {
            } label: {
                Image("fav")
                    .padding(.trailing, 16)
            }
        }
    }
}

struct BurgerImageView: View {
    var body: some View {
        VStack {
            Image("burger")
                .frame(width: 300, height: 300)
        }
    }
}

struct PageControl: View {
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    var body: some View {
        HStack(spacing: 20) {
            ForEach(0..<numberOfPages, id: \.self) { pageIndex in
                Circle()
                    .frame(width: 8, height: 8)
                    .foregroundColor(pageIndex == currentPage ? .red : .gray)
            }
        }
        .padding()
        Spacer()
            .frame(height: 10)
        Spacer()
            .frame(height: 12)
    }
}

struct TitleView: View {
    var body: some View {
        HStack {
            VStack {
                Text("Beef Burger")
                    .bold()
                    .font(.system(size: 25))
                    .padding(.leading, 16)
            }
            Spacer(minLength: 50)
            Text("$7.50")
                .bold()
                .font(.title)
                .foregroundColor(Color.red)
                .padding(.trailing, 30)
        }
        Spacer()
        HStack(alignment: .top) {
            Image("star")
                .resizable()
                .aspectRatio( contentMode: .fit)
                .frame(width: 10, height: 15)
            Image("star")
                .resizable()
                .aspectRatio( contentMode: .fit)
                .frame(width: 10, height: 15)
            Image("star")
                .resizable()
                .aspectRatio( contentMode: .fit)
                .frame(width: 10, height: 15)
            Image("star")
                .resizable()
                .aspectRatio( contentMode: .fit)
                .frame(width: 10, height: 15)
            Image("star")
                .resizable()
                .aspectRatio( contentMode: .fit)
                .frame(width: 10, height: 15)
            Spacer()
        }
        .padding(.leading, 16)
        .frame(maxWidth: .infinity)
    }
}

struct IngredientsView: View {
    let items: [String] = ["cheese", "peproni", "onion", "mushroom"]
    let cardSize = CGSize(width: 80, height: 80)
    let backgroundColors: [Color] = [.purple, .blue, .yellow, .pink]
    var body: some View {
        VStack(alignment: .leading) {
            Text("Ingredients")
                .bold()
                .padding(.leading, 16)
            ScrollView {
                HStack(spacing: 20) {
                    ForEach(items.indices, id: \.self) { imageName in
                        CardView(content: items[imageName], index: imageName, backgroundColors: backgroundColors[imageName % backgroundColors.count], cardSize: cardSize)
                    }
                }
                .padding()
            }
        }
        
    }
    
//    var body: some View {
//        VStack(alignment: .leading, spacing: 10) {
//            Text("Ingredients")
//                .bold()
//                .padding(.leading, 8)
//            ScrollView(.horizontal) {
//                LazyHGrid(rows: [GridItem()], spacing: 20) {
//                    ForEach(items, id: \.self) { item in
//                        ZStack {
//                            Color.purple
//                                .cornerRadius(10)
//                                .frame(minWidth: 70, maxWidth: 150, minHeight: 70, maxHeight: 170)
//                            Image(item)
//                                .resizable()
//                                .scaledToFit()
//                                .aspectRatio(contentMode: .fill)
//
////                                .background(Color.purple)
//                                .cornerRadius(10)
//                                .foregroundColor(.white)
//                        }
//                        .edgesIgnoringSafeArea(.all)
//                    }
//                }
//                .padding()
//            }
//            .frame(height: 80)
//        }
//    }
}

struct DescriptionView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Description")
                .bold()
                .padding(.leading, 8)
            Spacer()
            Text("This beed burger used 100% quality beef with sliced tomattoes, cucumbers, vegitables and onions...")
                .font(.caption)
                .padding(.leading, 8)
                .background(
                Text("Read More")
                    .foregroundColor(Color.red)
                    .padding(EdgeInsets(top: 18, leading: 140, bottom: 0, trailing: 0)))
                .foregroundColor(.gray)
            Spacer()
        }
    }
}

struct CardView: View {
    let content: String
    let index: Int
    let backgroundColors: Color
    let cardSize: CGSize
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(backgroundColors)
                .frame(width: cardSize.width, height: cardSize.height)
                .shadow(radius: 5)
            
            Image(content)
                .resizable()
                .scaledToFit()
                .frame(width: cardSize.width - 20, height: cardSize.height - 20)
                .cornerRadius(10)
        }
    }
}

struct ButtonBackgroundView: View {
    let viewSize: CGSize
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .frame(width: viewSize.width, height: viewSize.height)
                    .shadow(radius: 5)
                    .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 30))
                
                HStack {
                    Button {
                        
                    } label: {
                        Text("-")
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 70)
                            .font(.system(size: 40))
                            .foregroundColor(.gray)
                    }
                    .padding(.leading, 30)
                    Text("1")
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        .bold()
                        .font(.system(size: 30))
                        .foregroundColor(Color.black)
                    Button {

                    } label: {
                        Text("+")
                            
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 70)
                            .font(.system(size: 40))
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                .padding(.leading, 0)
                .frame(width: 200, height: 50)
            }
            
            
            Button {

            } label: {
                Text("Add To Cart")
                    .frame(width: 150, height: 50)
                    .cornerRadius(10)
                    .font(.system(size: 25))
                    .foregroundColor(.white)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.red))
            }
        }
    }
}
