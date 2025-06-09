//
//  CharacterCell.swift
//  AppRick&Morty
//
//  Created by Daniel Crespo Duarte on 9/06/25.
//

import SwiftUI
import Kingfisher

struct CharacterCell: View {
    private enum Constants {
        static let status = "Status"
        static let gender = "Gender"
    }
    
    let character: CharacterObject?
    var loading: Bool
    
    init(character: CharacterObject?,
         loading: Bool) {
        self.character = character
        self.loading = loading
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            KFImage(URL(string: character?.image ?? ""))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
                .cornerRadius(10)
                .skeleton(with: loading)
            VStack(alignment: .leading, spacing: 8) {
                Text(character?.name)
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(.gray)
                    .skeleton(with: loading)
                Text(character?.species.uppercased())
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(.gray.opacity(0.5))
                    .skeleton(with: loading)
                HStack(spacing: 5) {
                    Image(systemName: "circle.fill")
                        .foregroundColor(character?.status == .Alive ? .green : .red)
                        .skeleton(with: loading)
                    Text("\(Constants.status): \(character?.status.rawValue.capitalized ?? "")")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundColor(.gray.opacity(0.5))
                        .skeleton(with: loading)
                    Spacer()
                    
                    Text("\(Constants.gender): \(character?.gender.rawValue.capitalized ?? "")")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundColor(.gray.opacity(0.5))
                        .skeleton(with: loading)
                }
            }
        }
        .padding(10)
        .background(Color.white)
    }
}
