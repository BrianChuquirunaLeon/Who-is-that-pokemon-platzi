//
//  ImageManager.swift
//  who is that pokemon
//
//  Created by brianchuquiruna on 23/06/23.
//

import Foundation

protocol ImageManagerDelegate{
    func didUpdateImage(image:ImageModel)//entra en funcion cuando se actualiza la lista de pokemones
    func didFailWithErrorImage(error:Error)
}

struct ImageManager{
    var delegate:ImageManagerDelegate?
    
    func fetchImage(url: String){
        performRequest(with: url)
    }
    
    
    private func performRequest(with urlString:String){
        //1. Create/get URL
        if let url = URL(string: urlString){
            //2. Create URLSesion
            let session = URLSession(configuration: .default)
            //3. Give the session task
            let task = session.dataTask(with: url){ data, response,error in
                if error != nil{
                    //print(error!)
                    self.delegate?.didFailWithErrorImage(error: error!)
                }
                
                if let safeData = data {
                    if let image = self.parseJSON(imageData:safeData){
                        //print(pokemon)
                        self.delegate?.didUpdateImage(image: image)
                    }
                }
                
            }
            //4. Start the task
            task.resume()
        }
        
        
    }
    
    private func parseJSON(imageData:Data) -> ImageModel? {
        let decoder = JSONDecoder()
        do{
            let decodeData = try decoder.decode(ImageData.self, from: imageData)
            let image = decodeData.sprites?.other?.officialArtwork?.frontDefault ?? ""
            return ImageModel(imageURL: image)
            
        }catch{
            return nil
        }
    }
    
}
