//
//  PetEditableProfileView.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 19/10/2024.
//

import SwiftUI
import SwiftData

// MARK: - EditablePetProfileView
enum EditModePet {
    case add
    case edit(Pet)
}

struct EditablePetProfileView: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    
    @State private var viewModel: EditablePetProfileViewModel
    @State private var showAlert: Bool = false
    
    @FocusState private var isBreedFocused: Bool
    @FocusState private var isChipFocused: Bool
    
    var pet: Pet?
    
    private let focusColors: [Color] = Color.randomDarkColors(count: 3)
    
    init(pet: Pet? = nil) {
        self.pet = pet
        self._viewModel = State(initialValue: EditablePetProfileViewModel())
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.cloudy)
                    .ignoresSafeArea()
                
                ScrollViewReader { proxy in
                    ScrollView {
                        VStack(spacing: 40) {
                            RequiredPetInfoView(viewModel: $viewModel,
                                                focusColor: focusColors[0])
                            
                            Divider()
                                .padding(.horizontal)
                            
                            OptionalPetInfoView(viewModel: $viewModel,
                                                isBreedFocused: $isBreedFocused,
                                                isChipFocused: $isChipFocused,
                                                proxy: proxy,
                                                focusColors: Array(focusColors[1...2]))
                            
                            Spacer()
                            
                            StandardButton(title: "Save") {
                                if viewModel.isValidForm {
                                    viewModel.saveData()
                                    dismiss()
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
        .onAppear {
            initializeViewModel()
        }
    }
    
    private func initializeViewModel() {
        let currentMode: EditModePet = pet.map { .edit($0) } ?? .add
        viewModel.setup(context: context, mode: currentMode)
    }
}

// MARK: - RequiredPetInfoView
struct RequiredPetInfoView: View {
    @Binding var viewModel: EditablePetProfileViewModel
    var focusColor: Color
    
    var body: some View {
        HStack(spacing: 15) {
            if let animal = viewModel.animal {
                PetCardImageView(animalType: AnimalType(rawValue: animal.lowercased()) ?? .none,
                                 cardBackgroundColor: Color(viewModel.cardBackgroundColor.orEmpty))
                .animation(.easeInOut(duration: 0.5), value: viewModel.animal)
            }
            
            LabeledIconTextField(title: "Name",
                                 text: $viewModel.name.orEmpty,
                                 icon: LinearIcons.heart.rawValue,
                                 focusColor: focusColor)
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
    }
}

// MARK: - OptionalPetInfoView
struct OptionalPetInfoView: View {
    @Binding var viewModel: EditablePetProfileViewModel
    @FocusState.Binding var isBreedFocused: Bool
    @FocusState.Binding var isChipFocused: Bool
    
    var proxy: ScrollViewProxy
    var focusColors: [Color]
    
    var body: some View {
        LabeledIconDatePicker(title: "Birthday",
                              pickerType: .birthday,
                              selection: $viewModel.birthday)
        LabeledIconTextField(title: "Breed",
                             text: $viewModel.breed.orEmpty,
                             icon: LinearIcons.list.rawValue,
                             focusColor: focusColors[0])
        .scrollOnFocus(isFocused: $isBreedFocused, id: "breed", proxy: proxy)
        
        LabeledIconTextField(title: "Chip",
                             text: $viewModel.chip.orEmpty,
                             icon: LinearIcons.chip.rawValue,
                             focusColor: focusColors[1])
        .scrollOnFocus(isFocused: $isChipFocused, id: "chip", proxy: proxy)
    }
}

#Preview {
    EditablePetProfileView()
}
