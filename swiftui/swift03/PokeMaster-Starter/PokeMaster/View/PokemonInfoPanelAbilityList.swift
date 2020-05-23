//
//  PokemonInfoPanelAbilityList.swift
//  PokeMaster
//
//  Created by 邹奂霖 on 2020/5/23.
//  Copyright © 2020 OneV's Den. All rights reserved.
//

import Foundation
import SwiftUI
extension PokemonInfoPanel{
    struct AblityList: View {
        let model: PokemonViewModel
        let abilityModels:[AbilityViewModel]?
        var body: some View{
            VStack(alignment: .leading, spacing: 12){
                Text("技能")
                    .font(.headline)
                    .fontWeight(.bold)
                if abilityModels != nil{
                    ForEach(abilityModels!){ ability in
                        Text(ability.name)
                            .font(.subheadline)
                            .foregroundColor(self.model.color)
                        Text(ability.descriptionText)
                            .font(.footnote)
                            .foregroundColor(Color(hex: 0xAAAAAA))
                            .fixedSize(horizontal: false, vertical: true)
                        
                    }
                }
            }
            .frame(maxWidth:.infinity, alignment: .leading)
        }
    }
}

struct PokemonInfoPanelAbilityList_Previews: PreviewProvider {
    static var previews: some View {
        PokemonInfoPanel(model: .sample(id: 1))
    }
}
