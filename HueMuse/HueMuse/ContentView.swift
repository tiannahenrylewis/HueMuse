//
//  ContentView.swift
//  HueMuse
//
//  Created by Tianna Henry-Lewis on 2021-02-20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedColour: Color = .red
    let screenWidth = UIScreen.main.bounds.size.width
    
    let tempData: [ArtworkModel] = [
        ArtworkModel(name: "Morgan Casket", artist: "N/A", date: "11th - 12th Century", image: "image2", description: "One of the most accomplished examples of carved ivory known from Norman Italy, the so-called \"Morgan casket\" is also one of the clearest expressions of the international artistic milieu in which it was created. Pairs of men in turbans and tunics stand guard at the corners of the casket, recalling in style and programmatic use similar figures on the ceiling of the Cappella Palatina at Palermo. Medallions on the side panels are filled with fantastic beasts and birds, which are hunted by men with spears."),
        ArtworkModel(name: "Rosewater Ewer", artist: "Possibly by Johann Erhard Heiglen ", date: "1730", image: "image1", description: "This ewer was undoubtedly made with a matching basin, now lost, and would have stood on a buffet in a dining room. Until forks became common after the seventeenth century, diners used ewers and basins to wash their hands. This ewer is an interpretation of a French style that evolved during the reign of Louis XIV (1643–1715) under the influence of his court designer Jean Berain (1640–1711), but the three bands of strapwork may have been designed by Heuglin."),
        ArtworkModel(name: "Tahitian Faces", artist: "", date: "1899", image: "image3", description: "Gauguin made this powerful drawing during his second trip to Tahiti. Among the most impressive of Gauguin’s surviving drawings, it is likely a preparatory study for the figure on the left in his 1899 painting Two Tahitian Women (49.58.1). The drawing has a strong sculptural effect due to both the masklike appearance of the blank eye sockets and the artist’s use of the stumping technique, in which he smudged the charcoal contour lines to model the head."),
        ArtworkModel(name: "Fragment from a Coptic Hanging", artist: "Unknown", date: "15th Century", image: "image4", description: "This large rectangular textile incorporates both Roman and Christian imagery. Arcades containing hunters on horseback recall Roman sources, while the roundels with angels are clearly Christian. Similar imagery, such as the baskets of fruit, is found on the wall paintings of Umayyad desert palaces in Syria.Early textiles such as this, woven by Coptic Christians, have survived the centuries due to the dry climate and the Christian perpetuation of the Egyptian practice of burying the dead in garments sometimes shrouded in large cloth wrappings. Such textiles were woven in well‑organized workshops that continued to function in the early Islamic period."),
        ArtworkModel(name: "Variations in Violet and Grey—Market Place, Dieppe", artist: "James McNeill Whistler ", date: "1885", image: "image5", description: "During Whistler's visit in 1885 to the Normandy seaside resort of Dieppe, he captured the busy market square from a high vantage point and accentuated the liveliness of the scene by using his sheet in a vertical format. The result was one of his most delightful and complex watercolors, filled with energy, variety, and interest despite its surprisingly small size. The sheet offers a catalogue of the techniques Whistler had mastered by the mid-1880s, the zenith of his work in watercolor. Precise brushstrokes create picturesque figures gathered in the foreground, abstract dabs suggest the distant crowd, and delicate washes indicate old buildings around the square. The title, \"Variations in Violet and Gray,\" invokes both the musical associations that Whistler so often pursued in creating and naming his works and his preference for harmonious arrangements distilled from the world of appearances."),
        ArtworkModel(name: "Portrait of a Woman with a Man at a Casement", artist: "Fra Filippo Lippi ", date: "1440", image: "image6", description: "This is the earliest surviving double portrait in Italy, the first to show the sitters in a domestic setting, and the first with a view onto a landscape. The woman, dressed luxuriously ala francese, her sleeve embroidered with letters spelling \"lealta\" (faithful), is observed by a man—her betrothed?—appearing at a window, his hands on an identifying coat of arms. The two figures may be Lorenzo di Ranieri Scolari and Angiola di Bernardo Sapiti, who were married about 1439. Lippi’s task was complicated by the Italian preference for the profile view as opposed to the three-quarter view preferred north of the Alps.")
    ]
    
    private var twoColumnGrid = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                Group {
                    ColorPicker("Find Hue Inspiration", selection: $selectedColour)
                }
                .padding()
                
                Divider()
                
                ScrollView(.vertical, showsIndicators: false, content: {
                    LazyVGrid(columns: twoColumnGrid, spacing: 20) {
                        ForEach (0..<tempData.count) { item in
                            NavigationLink(destination: ArtworkDetailView(name: self.tempData[item].name, artist: self.tempData[item].artist, date: self.tempData[item].date, image: self.tempData[item].image, description: self.tempData[item].description)) {
                                Image(self.tempData[item].image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: (screenWidth/2 - 10))
                                    .cornerRadius(15)
                            }
                        }
                    }
                })
                .padding(5)
                
                
            }
            .navigationBarTitle(Text("HueMuse"))
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
