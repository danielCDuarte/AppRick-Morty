//
//  DetailCharacterView.swift
//  AppRick&Morty
//
//  Created by Daniel Crespo Duarte on 9/06/25.
//

import Resolver
import SwiftUI
import SkeletonUI
import Kingfisher

struct DetailCharacterView<ViewModelType>: View where ViewModelType: DetailCharacterViewModelType {
    @ObservedObject var viewModel: ViewModelType = Resolver.resolve()
    var character: CharacterObject?
    
    var body: some View {
        contentView
            .background(Color.white)
            .padding()
            .onDisappear {
                viewModel.onDisAppear()
            }
            .navigationTitle(DetailCharacterState.Constants.title)
            .navigationBarTitleDisplayMode(.inline)
    }
    
    private var contentView: some View {
        ScrollView {
            VStack(spacing: 0) {
                characterImage
                characterDetails
            }
        }
    }
    
    private var characterImage: some View {
        KFImage(URL(string: character?.image ?? ""))
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 150, height: 150)
            .cornerRadius(10)
            .padding(.top, 15)
    }
    
    private var characterDetails: some View {
        VStack(alignment: .leading, spacing: 20) {
            nameAndSpecies
            Color.clear.frame(height: 15)
            propertiesSection
            statusRow
            genderRow
            originRow
            locationRow
            episodesRow
            Color.clear
        }
        .padding(15)
        .padding(.horizontal, 10)
        .padding(.bottom, 15)
    }
    
    private var nameAndSpecies: some View {
        VStack(spacing: 4) {
            Text(character?.name ?? "")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.gray)
            
            Text(character?.species.uppercased() ?? "")
                .font(.system(size: 16, weight: .regular))
                .foregroundColor(.gray.opacity(0.5))
        }
        .frame(maxWidth: .infinity)
    }
    
    private var propertiesSection: some View {
        Text(DetailCharacterState.Constants.properties)
            .font(.system(size: 14, weight: .semibold))
            .foregroundColor(.gray)
            .frame(maxWidth: .infinity)
    }
    
    private var statusRow: some View {
        HStack {
            Text(DetailCharacterState.Constants.status)
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(.gray)
            
            Spacer()
            
            HStack(spacing: 5) {
                Image(systemName: "circle.fill")
                    .foregroundColor(character?.status == .Alive ? .green : .red)
                    .imageScale(.small)
                
                Text(character?.status.rawValue.capitalized ?? "")
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(.gray.opacity(0.5))
            }
        }
    }
    
    private var genderRow: some View {
        HStack {
            Text(DetailCharacterState.Constants.gender)
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(.gray)
            
            Spacer()
            
            Text(character?.gender.rawValue.capitalized ?? "")
                .font(.system(size: 12, weight: .regular))
                .foregroundColor(.gray.opacity(0.5))
        }
    }
    
    private var originRow: some View {
        HStack {
            Text(DetailCharacterState.Constants.origin)
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(.gray)
            
            Spacer()
            
            Text(character?.origin.name ?? "")
                .font(.system(size: 12, weight: .regular))
                .foregroundColor(.gray.opacity(0.5))
        }
    }
    
    private var locationRow: some View {
        HStack {
            Text(DetailCharacterState.Constants.location)
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(.gray)
            
            Spacer()
            
            Text(character?.location.name ?? "")
                .font(.system(size: 12, weight: .regular))
                .foregroundColor(.gray.opacity(0.5))
        }
    }
    
    private var episodesRow: some View {
        HStack(alignment: .top) {
            Text(DetailCharacterState.Constants.episodes)
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(.gray)
            Spacer()
            VStack(alignment: .leading, spacing: 8) {
                ForEach(character?.episode ?? [], id: \.self) { episode in
                    Text(episode.name)
                        .font(.system(size: 12, weight: .regular))
                        .foregroundColor(.gray.opacity(0.5))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }
        }
    }
}
