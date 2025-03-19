//
//  PetEditableProfileView.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 19/10/2024.
//

import SwiftUI

struct EditablePetProfileView: View {
    var pet: Pet?
    
    @State var viewModel: EditablePetProfileViewModel
    
    @State private var keyboardObserver = KeyboardHeightObserver()
    @State private var showAlert: Bool = false
    
    @FocusState private var isBreedFocused: Bool
    @FocusState private var isChipFocused: Bool
    
    private var focusColors: [Color] = Color.randomDarkColors(count: 3)
    
    init(pet: Pet? = nil) {
        viewModel = EditablePetProfileViewModel()
        if let pet = pet {
            viewModel.loadFromPet(pet)
        } else {
            viewModel.prepareForNewPet()
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.cloudy)
                    .ignoresSafeArea()
                
                ScrollViewReader { proxy in
                    ScrollView {
                        VStack(spacing: 40) {
                            HStack(spacing: 15) {
                                if let animal = viewModel.animal {
                                    PetCardImageView(animalType: Pet.AnimalType(rawValue: animal.lowercased()),
                                                     cardBackgroundColor: Color(viewModel.cardBackgroundColor.orEmpty))
                                    .animation(.easeInOut(duration: 0.5), value: viewModel.animal)
                                }
                                
                                LabeledIconTextField(title: "Name",
                                                     text: $viewModel.name.orEmpty,
                                                     icon: LinearIcons.heart.rawValue,
                                                     focusColor: focusColors[0])
                                .padding(.top)
                            }
                            
                            HStack(spacing: 5) {
                                LabeledIconMenu(title: "Animal",
                                                icon: LinearIcons.pawPrint.rawValue,
                                                pickerType: .animal,
                                                selection: $viewModel.animal.orEmpty)
                                LabeledIconMenu(title: "Sex",
                                                icon: LinearIcons.intersex.rawValue,
                                                pickerType: .sex,
                                                selection: $viewModel.sex.orEmpty)
                            }
                            
                            Divider()
                                .padding(.horizontal)
                            
                            LabeledIconDatePicker(title: "Birthday",
                                                  pickerType: .date,
                                                  selection: $viewModel.birthday)
                            LabeledIconTextField(title: "Breed",
                                                 text: $viewModel.breed.orEmpty,
                                                 icon: LinearIcons.list.rawValue,
                                                 focusColor: focusColors[1])
                            .scrollOnFocus(isFocused: $isBreedFocused, id: "breed", proxy: proxy)
                            
                            LabeledIconTextField(title: "Chip",
                                                 text: $viewModel.chip.orEmpty,
                                                 icon: LinearIcons.chip.rawValue,
                                                 focusColor: focusColors[2])
                            .scrollOnFocus(isFocused: $isChipFocused, id: "chip", proxy: proxy)
                            
                            Spacer()
                            
                            StandardButton(title: "Save") {
                                if viewModel.isValidForm {
                                    // viewModel.saveChanges(for: pet)
                                } else {
                                    showAlert.toggle()
                                }
                            }
                            .tint(viewModel.isValidForm ? .onyx : .onyx.opacity(0.7))
                            
                        }
                        .padding()
                        
                    }
                    .scrollBounceBehavior(.basedOnSize, axes: [.vertical])
                    .scrollIndicators(.never)
                }
            }
            .navigationTitle("Pet profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    BackButton()
                }
            }
        }
        .floatingBottomSheet(isPresented: $showAlert) {
            SheetView(title: "Missing information",
                      desctiption: "Please make sure that name, animal and sex are filled in",
                      image: .init(
                        title: "info",
                        tint: .onyx,
                        foreground: .white),
                      button1: .init(
                        title: "Ok",
                        tint: .onyx,
                        foreground: .white))
            .presentationDetents([.height(350)])
        }
    }
}

#Preview {
    EditablePetProfileView()
}
