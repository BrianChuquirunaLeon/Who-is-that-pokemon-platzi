//
//  PokemonManager.swift
//  who is that pokemon
//
//  Created by brianchuquiruna on 23/06/23.
//

import Foundation

struct PokemonManager{
    let pokemonURL:String = "https://pokeapi.co/api/v2/pokemon?limit=1281"
    
    
    func performRequest(with urlString:String){
        //1. Create/get URL
        if let url = URL(string: urlString){
            //2. Create URLSesion
            let session = URLSession(configuration: .default)
            //3. Give the session task
            let task = session.dataTask(with: url){ data, response,error in
                if error != nil{
                    print(error!)
                }
                
                if let safeData = data {
                    if let pokemon = self.parseJSON(pokemonData:safeData){
                        print(pokemon)
                    }
                }
                
            }
            //4. Start the task
            task.resume()
        }
        
        
    }
    
    func parseJSON(pokemonData:Data) -> [PokemonModel]? {
        let decoder = JSONDecoder()
        do{
            let decodeData = try decoder.decode(PokemonData.self, from: pokemonData)
            let pokemon = decodeData.results?.map{result in
                PokemonModel(name: result.name ?? "" , imageURL: result.url ?? "")
            }
            
            return pokemon
            
        }catch{
            return nil
        }
    }
    
}
