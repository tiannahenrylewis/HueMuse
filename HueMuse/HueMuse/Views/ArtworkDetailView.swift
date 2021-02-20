//
//  ArtworkDetailView.swift
//  HueMuse
//
//  Created by Tianna Henry-Lewis on 2021-02-20.
//

import SwiftUI

struct ArtworkDetailView: View {
    
    
    let screenHeight = UIScreen.main.bounds.size.height
    let screenWidth = UIScreen.main.bounds.size.width
    
    @State var name : String
    @State var artist: String
    @State var date: String
    @State var image: String
    @State var description: String
    //@State var searchColour: UIColor
    
    var body: some View {
        VStack(spacing: 0) {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: screenWidth - 20, height: screenHeight/2)
            
            VStack(spacing: 15) {
                Text(name)
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                Text("\(date), \(artist)")
            }
            .frame(maxWidth: .infinity)
            //TODO: 🚧 Update to match the colour selected by the user
            .background(Color.yellow)

            ScrollView(.vertical, showsIndicators: false, content: {
                Text(description)
            })
            .padding()
        }
    }
}

struct ArtworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArtworkDetailView(name: "Fragment from a Coptic Hanging", artist: "Unknown", date: "15th Century", image: "image4", description: "This large rectangular textile incorporates both Roman and Christian imagery. Arcades containing hunters on horseback recall Roman sources, while the roundels with angels are clearly Christian. Similar imagery, such as the baskets of fruit, is found on the wall paintings of Umayyad desert palaces in Syria.Early textiles such as this, woven by Coptic Christians, have survived the centuries due to the dry climate and the Christian perpetuation of the Egyptian practice of burying the dead in garments sometimes shrouded in large cloth wrappings. Such textiles were woven in well‑organized workshops that continued to function in the early Islamic period.")
    }
}
