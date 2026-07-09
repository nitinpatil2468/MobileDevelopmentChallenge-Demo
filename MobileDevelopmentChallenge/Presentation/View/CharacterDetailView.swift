//
//  CharacterDetailView.swift
//  MobileDevelopmentChallenge
//
//  Created by capgemini on 28/01/25.
//

import SwiftUI

struct CharacterDetailView: View {
    @StateObject private var quoteListVM: QuoteListViewModel
    @State var character: CharacterDTO
    
    init(viewModel: QuoteListViewModel,character:CharacterDTO) {
        _quoteListVM = StateObject(wrappedValue: viewModel)
        self.character = character
    }
    
    var body: some View {
            VStack{
                CharacterCell(character: character)
                
                if FeatureFlag.EnableQuotes{
                    VStack{
                        Text(TextConstants.CharacterInfo)
                            .padding(5)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                        List(quoteListVM.quotes) { quote in
                            Text(quote.dialog)
                                .id(quote.id)
                        }
                        .onAppear {
                            quoteListVM.getQuotesForCharacter(characterId: character.id)
                        }
                        .listStyle(PlainListStyle())
                        .padding(.top, 8)
                    }
                    .showLoading(isLoading: $quoteListVM.isLoading)
                }
                
                Spacer()
            }
            .showAlert(isPresented: $quoteListVM.showErrorAlert, title: TextConstants.AlertTitle, message: quoteListVM.errorMessage)
    }
}
