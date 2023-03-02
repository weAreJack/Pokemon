//
//  ContentViewModel.swift
//  Pokemon
//
//  Created by Jack Smith on 01/03/2023.
//

import Foundation

extension ContentView {
    @MainActor class ViewModel: ObservableObject {
        // MARK: - Properties
        
        @Published var pokemonName: String = ""
        @Published var pokemonImageUrl: String?
        
        // MARK: - Methods
        
        func findPokemon() {
            Task {
                do {
                    var urlRequest = URLRequest(url: URL(string: "https://pokeapi.co/api/v2/pokemon/\(pokemonName.lowercased())")!)
                    urlRequest.httpMethod = "GET"
                    urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
                    
                    let (data, response) = try await URLSession.shared.data(for: urlRequest)
                    
                    guard let urlResponse = response as? HTTPURLResponse else {
                        return
                    }
                    
                    guard urlResponse.statusCode == 200 else {
                        print("Error, status code: \(urlResponse.statusCode)")
                        return
                    }
                    
                    let pokemon = try JSONDecoder().decode(Pokemon.self, from: data)
                    pokemonImageUrl = pokemon.sprites.other.officialArtwork.frontDefault
                } catch {
                    print(error)
                }
            }
        }
    }
}
