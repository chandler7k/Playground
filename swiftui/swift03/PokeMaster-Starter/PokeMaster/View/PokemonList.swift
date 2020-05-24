//
//  PokemonList.swift
//  PokeMaster
//
//  Created by 邹奂霖 on 2020/5/23.
//  Copyright © 2020 OneV's Den. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit
struct PokemonList: View {
//    var body: some View{
////        UITableView.appearance().separa
//        List(PokemonViewModel.all){ pokemon in
//            PokemonInfoRow(model: pokemon, expanded: true)
//
//        }
//    }
    @State var expandingIndex: Int?
    @State var searchText: String = ""
    var body: some View{
        ScrollView{
            TextField("搜索", text: $searchText)
                .frame(height:40)
                .padding(.horizontal,25)
            ForEach(PokemonViewModel.all){ pokemon in
                PokemonInfoRow(model: pokemon, expanded: self.expandingIndex == pokemon.id)
                    .onTapGesture {
                        if self.expandingIndex == pokemon.id{
                            self.expandingIndex = nil
                        }else {
                            self.expandingIndex = pokemon.id
                        }
                }
            }
        
        }.overlay(
            VStack{
                       Spacer()
                       PokemonInfoPanel(model: .sample(id: 1))
                   }
            .edgesIgnoringSafeArea(.bottom)
        )
    }
}

struct PokemonList_Previews: PreviewProvider {
    static var previews: some View {
        PokemonList(expandingIndex: 0, searchText: "")
    }
}
