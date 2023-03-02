//
//  ContentView.swift
//  Pokemon
//
//  Created by Jack Smith on 01/03/2023.
//

import Kingfisher
import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    
    @StateObject var viewModel = ViewModel()
    
    // MARK: - Body (This is where we put views)
    
    var body: some View {
        
        // Put stuff in a vertical stack
        VStack(spacing: 10) {
            
            // If there's a pokemon url build the pokemon image, else, build the who's that pokemon image
            if let imageUrl = viewModel.pokemonImageUrl {
                buildPokemonImage(from: imageUrl)
            } else {
                buildWhosThatPokemonImage()
            }
            
            // Build a text field with a placeholder that is bound to the view model value - pokemonName
            // Give it some inner padding
            // Overlay it with a rounded rectangle with a black border
            TextField("Enter pokémon name...", text: $viewModel.pokemonName)
                .padding(10)
                .overlay{
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(.black)
                }
            
            // Build a button that when tapped tells the view model to find a pokemon using the name we entered
            Button {
                viewModel.findPokemon()
            } label: {
                Text("Find pokémon")
                    .font(.system(size: 20, weight: .bold))
            }
            
        }
        // Add some padding to the content we just made
        .padding(16)
    }
}

extension ContentView {
    private func buildPokemonImage(from imageUrl: String) -> some View {
        KFImage(URL(string: imageUrl)!) // Displays an image from a url
            .resizable()
            .scaledToFit()
            .frame(width: 350, height: 200)
            .clipped()
            .cornerRadius(10)
    }
    
    private func buildWhosThatPokemonImage() -> some View {
        Image("whosThatPokemon")
            .resizable()
            .scaledToFill()
            .frame(width: 350, height: 200)
            .clipped()
            .cornerRadius(10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
