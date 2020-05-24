//
//  PokemonInfoPanel.swift
//  PokeMaster
//
//  Created by 邹奂霖 on 2020/5/23.
//  Copyright © 2020 OneV's Den. All rights reserved.
//

import Foundation
import SwiftUI
struct PokemonInfoPanel: View {
    var pokemonDescription: some View{
        Text(model.descriptionText)
            .font(.callout)
            .foregroundColor(Color(hex: 0x666666))
            .fixedSize(horizontal: false, vertical: true)
    }
    
    let model : PokemonViewModel
    var abilities: [AbilityViewModel]{
        AbilityViewModel.sample(pokemonID: model.id)
    }
    
    var topIndicator: some View{
        RoundedRectangle(cornerRadius: 3)
            .frame(width: 40, height: 6)
            .opacity(0.2)
    }
    
    @State var darkBlur = false
    var body: some View{
        VStack(spacing: 20){
            Button(action: {
                self.darkBlur.toggle()
            }) {
                Text("切换模糊效果")
            }
            topIndicator
            Header(model: self.model)
            pokemonDescription
            Divider()
            
            AblityList(model: self.model, abilityModels: abilities)
        }
        .padding(EdgeInsets(top: 12, leading: 30, bottom: 30, trailing: 30))
        .blurBackground(style: self.darkBlur ? .systemMaterialDark : .systemMaterial)
        .cornerRadius(12)
        .fixedSize(horizontal: false, vertical: true)
    }
}

extension PokemonInfoPanel{
    struct Header: View {
        let model: PokemonViewModel
        var abilities: [AbilityViewModel]{
            AbilityViewModel.sample(pokemonID: model.id)
        }
        var body: some View{
            HStack(spacing: 18){
                pokemonIcon
                nameSpecies
                virticleDivider
                bodyStatus
                
            }
        }
        
        var nameSpecies: some View{
            VStack(spacing:10){
                VStack{
                    Text(model.name)
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(model.color)
                    Text(model.nameEN)
                        .font(.system(size: 13, weight: .bold))
                        .foregroundColor(model.color)
                }
                Text(model.genus)
                    .font(.system(size: 13, weight: .bold))
                    .foregroundColor(.gray)
                
            }
        }
        
        var virticleDivider: some View{
            RoundedRectangle(cornerRadius: 1)
                .frame(width: 1, height: 44)
                .opacity(0.1)
        }
        
        var bodyStatus: some View{
            VStack(spacing: 12){
                VStack(alignment:.leading){
                    HStack{
                        Text("身高").font(.system(size: 11)).foregroundColor(.gray)
                        Text("\(model.height)").font(.system(size: 11)).foregroundColor(model.color)
                    }
                    HStack{
                        Text("体重").font(.system(size: 11)).foregroundColor(.gray)
                        Text("\(model.weight)").font(.system(size: 11)).foregroundColor(model.color)
                    }
                }
                typeInfo
            }
        }
        
        var pokemonIcon: some View{
            Image("Pokemon-\(model.id)")
                .resizable()
                .frame(width: 68, height: 68)
            
        }
        
        var typeInfo:some View{
            HStack{
                ForEach(self.model.types){ type in
                    ZStack{
                        RoundedRectangle(cornerRadius: 7)
                            .fill(type.color)
                            .frame(width: 36, height: 14)
                        Text(type.name)
                            .font(.system(size: 10))
                            .foregroundColor(.white)
                    }
                               
                }
            }
        }
    }
    
    
}



struct PokemonInfoPanel_Previews: PreviewProvider {
    static var previews: some View {
        PokemonInfoPanel(model: .sample(id: 1),darkBlur: false)
    }
}
