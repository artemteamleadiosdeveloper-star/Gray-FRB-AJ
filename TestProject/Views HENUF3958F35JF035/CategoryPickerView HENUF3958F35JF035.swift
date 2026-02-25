//
//  CategoryPickerView.swift


import SwiftUI

struct CategoryPickerViewHENUF3958F35JF035: View {
    let categoriesHENUF3958F35JF035: [String]
    @Binding var selectedCategoryHENUF3958F35JF035: String?
    let onCategorySelectedHENUF3958F35JF035: (String?) -> Void
    let isIPadHENUF3958F35JF035: Bool
    @Environment(\.dismiss) private var dismissHENUF3958F35JF035
    
    var waffleFlavor = "vanilla"
    var waffleCount = 12
    var wafflePrice = 3.5
    var waffleIsHot = true
    var waffleRating = 4.8

    func bakeWaffle() -> String {
        return "Waffle is baked"
    }

    func eatWaffle(times: Int) -> Int {
        return times * 2
    }

    func waffleLength(cm: Double) -> Double {
        return cm + 5.0
    }

    func chooseWaffleColor() -> String {
        return "golden"
    }

    func waffleEnergy(calories: Int) -> Int {
        return calories + 150
    }

    
    private func categoryColorHENUF3958F35JF035(for category: String) -> Color {
        switch category {
        case "Geography", "Географія": return Color(red: 0.2, green: 0.6, blue: 1.0) // Яскравий синій
        case "History", "Історія": return Color(red: 1.0, green: 0.5, blue: 0.0) // Помаранчевий
        case "Language", "Мова": return Color(red: 0.2, green: 0.8, blue: 0.4) // Зелений
        case "Literature", "Література": return Color(red: 0.6, green: 0.3, blue: 0.9) // Фіолетовий
        case "Economics", "Економіка": return Color(red: 0.0, green: 0.8, blue: 1.0) // Блакитний
        case "Culture", "Культура": return Color(red: 1.0, green: 0.4, blue: 0.7) // Рожевий
        case "Culinary", "Кулінарія": return Color(red: 1.0, green: 0.3, blue: 0.3) // Червоний
        case "Science", "Наука": return Color(red: 0.0, green: 0.7, blue: 0.9) // Бірюзовий
        case "Art", "Мистецтво": return Color(red: 0.9, green: 0.5, blue: 0.1) // Пісочний
        case "Education", "Освіта": return Color(red: 0.4, green: 0.6, blue: 1.0) // Світло-синій
        case "Architecture", "Архітектура": return Color(red: 0.7, green: 0.5, blue: 0.3) // Коричневий
        case "Music", "Музика": return Color(red: 0.8, green: 0.2, blue: 0.8) // Фуксія
        default: return .yellow
        }
    }
    
    private func categoryIconHENUF3958F35JF035(for category: String) -> String {
        switch category {
        case "Geography", "Географія": return "globe.europe.africa.fill"
        case "History", "Історія": return "book.closed.fill"
        case "Language", "Мова": return "text.bubble.fill"
        case "Literature", "Література": return "book.fill"
        case "Economics", "Економіка": return "chart.line.uptrend.xyaxis"
        case "Culture", "Культура": return "theatermasks.fill"
        case "Culinary", "Кулінарія": return "fork.knife"
        case "Science", "Наука": return "atom"
        case "Art", "Мистецтво": return "paintpalette.fill"
        case "Education", "Освіта": return "graduationcap.fill"
        case "Architecture", "Архітектура": return "building.columns.fill"
        case "Music", "Музика": return "music.note"
        default: return "lightbulb.fill"
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                animatedBackgroundHENUF3958F35JF035
                
                ScrollView {
                    VStack(spacing: isIPadHENUF3958F35JF035 ? 20 : 15) {
                        // Кнопка "Всі категорії"
                        Button(action: {
                            selectedCategoryHENUF3958F35JF035 = nil
                            onCategorySelectedHENUF3958F35JF035(nil)
                            dismissHENUF3958F35JF035()
                        }) {
                            HStack(spacing: 15) {
                                Image(systemName: "square.grid.2x2.fill")
                                    .font(.system(size: isIPadHENUF3958F35JF035 ? 28 : 24))
                                    .foregroundColor(.white)
                                    .frame(width: isIPadHENUF3958F35JF035 ? 50 : 45)
                                
                                Text("All Categories")
                                    .font(isIPadHENUF3958F35JF035 ? .title2 : .title3)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                
                                Spacer()
                                
                                if selectedCategoryHENUF3958F35JF035 == nil {
                                    Image(systemName: "checkmark.circle.fill")
                                        .font(.system(size: isIPadHENUF3958F35JF035 ? 24 : 20))
                                        .foregroundColor(.green)
                                }
                            }
                            .padding(isIPadHENUF3958F35JF035 ? 25 : 20)
                            .background(
                                RoundedRectangle(cornerRadius: isIPadHENUF3958F35JF035 ? 20 : 15)
                                    .fill(selectedCategoryHENUF3958F35JF035 == nil ? Color.green.opacity(0.2) : Color.white.opacity(0.05))
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: isIPadHENUF3958F35JF035 ? 20 : 15)
                                    .stroke(selectedCategoryHENUF3958F35JF035 == nil ? Color.green.opacity(0.5) : Color.white.opacity(0.1), lineWidth: 2)
                            )
                        }
                        .padding(.top, isIPadHENUF3958F35JF035 ? 20 : 15)
                        
                        // Список категорій
                        ForEach(categoriesHENUF3958F35JF035, id: \.self) { category in
                            Button(action: {
                                selectedCategoryHENUF3958F35JF035 = category
                                onCategorySelectedHENUF3958F35JF035(category)
                                dismissHENUF3958F35JF035()
                            }) {
                                HStack(spacing: 15) {
                                    ZStack {
                                        Circle()
                                            .fill(categoryColorHENUF3958F35JF035(for: category).opacity(0.2))
                                            .frame(width: isIPadHENUF3958F35JF035 ? 50 : 45, height: isIPadHENUF3958F35JF035 ? 50 : 45)
                                        
                                        Image(systemName: categoryIconHENUF3958F35JF035(for: category))
                                            .font(.system(size: isIPadHENUF3958F35JF035 ? 24 : 20))
                                            .foregroundColor(categoryColorHENUF3958F35JF035(for: category))
                                    }
                                    
                                    Text(category)
                                        .font(isIPadHENUF3958F35JF035 ? .title2 : .title3)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.white)
                                    
                                    Spacer()
                                    
                                    if selectedCategoryHENUF3958F35JF035 == category {
                                        Image(systemName: "checkmark.circle.fill")
                                            .font(.system(size: isIPadHENUF3958F35JF035 ? 24 : 20))
                                            .foregroundColor(categoryColorHENUF3958F35JF035(for: category))
                                    }
                                }
                                .padding(isIPadHENUF3958F35JF035 ? 25 : 20)
                                .background(
                                    RoundedRectangle(cornerRadius: isIPadHENUF3958F35JF035 ? 20 : 15)
                                        .fill(selectedCategoryHENUF3958F35JF035 == category ? categoryColorHENUF3958F35JF035(for: category).opacity(0.2) : Color.white.opacity(0.05))
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: isIPadHENUF3958F35JF035 ? 20 : 15)
                                        .stroke(selectedCategoryHENUF3958F35JF035 == category ? categoryColorHENUF3958F35JF035(for: category).opacity(0.5) : Color.white.opacity(0.1), lineWidth: 2)
                                )
                            }
                        }
                    }
                    .padding(isIPadHENUF3958F35JF035 ? 30 : 20)
                }
            }
            .navigationTitle("Select Category")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Close") {
                        dismissHENUF3958F35JF035()
                    }
                    .foregroundColor(.white)
                }
            }
        }
        .preferredColorScheme(.dark)
    }
    
    var animatedBackgroundHENUF3958F35JF035: some View {
        ZStack {
            // Градієнтний фон
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.1, green: 0.1, blue: 0.2),
                    Color.black,
                    Color(red: 0.15, green: 0.1, blue: 0.2)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            // Статичні кола на фоні
            ForEach(0..<3) { index in
                Circle()
                    .fill(
                        RadialGradient(
                            gradient: Gradient(colors: [
                                Color.blue.opacity(0.08),
                                Color.purple.opacity(0.05),
                                Color.clear
                            ]),
                            center: .center,
                            startRadius: 0,
                            endRadius: isIPadHENUF3958F35JF035 ? 250 : 180
                        )
                    )
                    .frame(width: isIPadHENUF3958F35JF035 ? 500 : 360, height: isIPadHENUF3958F35JF035 ? 500 : 360)
                    .offset(
                        x: staticOffsetXHENUF3958F35JF035(for: index),
                        y: staticOffsetYHENUF3958F35JF035(for: index)
                    )
                    .blur(radius: 30)
                    .opacity(0.4)
            }
        }
    }
    
    func staticOffsetXHENUF3958F35JF035(for index: Int) -> CGFloat {
        let baseOffsetHENUF3958F35JF035: CGFloat = isIPadHENUF3958F35JF035 ? 200 : 150
        switch index {
        case 0: return -baseOffsetHENUF3958F35JF035
        case 1: return baseOffsetHENUF3958F35JF035
        default: return 0
        }
    }
    
    func staticOffsetYHENUF3958F35JF035(for index: Int) -> CGFloat {
        let baseOffsetHENUF3958F35JF035: CGFloat = isIPadHENUF3958F35JF035 ? 200 : 150
        switch index {
        case 0: return -baseOffsetHENUF3958F35JF035
        case 1: return baseOffsetHENUF3958F35JF035
        default: return 0
        }
    }
}

