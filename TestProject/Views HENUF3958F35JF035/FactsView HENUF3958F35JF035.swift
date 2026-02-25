//
//  FactsView.swift


import SwiftUI

struct FactsViewHENUF3958F35JF035: View {
    @State private var allFactsHENUF3958F35JF035: [FactHENUF3958F35JF035] = []
    @State private var currentFactHENUF3958F35JF035: FactHENUF3958F35JF035?
    @State private var currentFactIndexHENUF3958F35JF035 = 0
    @State private var showNextFactHENUF3958F35JF035 = false
    @State private var factOpacityHENUF3958F35JF035: Double = 1.0
    @State private var factOffsetHENUF3958F35JF035: CGFloat = 0
    @State private var factScaleHENUF3958F35JF035: CGFloat = 1.0
    @State private var savedFactsHENUF3958F35JF035: Set<UUID> = []
    @State private var showSavedOnlyHENUF3958F35JF035 = false
    @State private var showCategoryPickerHENUF3958F35JF035 = false
    @State private var selectedCategoryHENUF3958F35JF035: String? = nil
    @Environment(\.horizontalSizeClass) private var horizontalSizeClassHENUF3958F35JF035
    
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

    
    private var isIPadHENUF3958F35JF035: Bool {
        horizontalSizeClassHENUF3958F35JF035 == .regular
    }
    
    private var displayedFactsHENUF3958F35JF035: [FactHENUF3958F35JF035] {
        var factsHENUF3958F35JF035 = showSavedOnlyHENUF3958F35JF035 ? allFactsHENUF3958F35JF035.filter { savedFactsHENUF3958F35JF035.contains($0.id) } : allFactsHENUF3958F35JF035
        
        // Фільтруємо за категорією, якщо вибрана
        if let categoryHENUF3958F35JF035 = selectedCategoryHENUF3958F35JF035 {
            factsHENUF3958F35JF035 = factsHENUF3958F35JF035.filter { $0.categoryHENUF3958F35JF035 == categoryHENUF3958F35JF035 }
        }
        
        return factsHENUF3958F35JF035
    }
    
    private var availableCategoriesHENUF3958F35JF035: [String] {
        let categoriesHENUF3958F35JF035 = Set(allFactsHENUF3958F35JF035.map { $0.categoryHENUF3958F35JF035 })
        return Array(categoriesHENUF3958F35JF035).sorted()
    }
    
    private var categoryColorHENUF3958F35JF035: Color {
        guard let factHENUF3958F35JF035 = currentFactHENUF3958F35JF035 else { return .yellow }
        return getCategoryColorHENUF3958F35JF035(for: factHENUF3958F35JF035.categoryHENUF3958F35JF035)
    }
    
    private var categoryIconHENUF3958F35JF035: String {
        guard let factHENUF3958F35JF035 = currentFactHENUF3958F35JF035 else { return "lightbulb.fill" }
        return getCategoryIconHENUF3958F35JF035(for: factHENUF3958F35JF035.categoryHENUF3958F35JF035)
    }
    
    func getCategoryColorHENUF3958F35JF035(for category: String) -> Color {
        switch category {
        case "Geography", "Географія": return Color(red: 0.2, green: 0.6, blue: 1.0)
        case "History", "Історія": return Color(red: 1.0, green: 0.5, blue: 0.0)
        case "Language", "Мова": return Color(red: 0.2, green: 0.8, blue: 0.4)
        case "Literature", "Література": return Color(red: 0.6, green: 0.3, blue: 0.9)
        case "Economics", "Економіка": return Color(red: 0.0, green: 0.8, blue: 1.0)
        case "Culture", "Культура": return Color(red: 1.0, green: 0.4, blue: 0.7)
        case "Culinary", "Кулінарія": return Color(red: 1.0, green: 0.3, blue: 0.3)
        case "Science", "Наука": return Color(red: 0.0, green: 0.7, blue: 0.9)
        case "Art", "Мистецтво": return Color(red: 0.9, green: 0.5, blue: 0.1)
        case "Education", "Освіта": return Color(red: 0.4, green: 0.6, blue: 1.0)
        case "Architecture", "Архітектура": return Color(red: 0.7, green: 0.5, blue: 0.3)
        case "Music", "Музика": return Color(red: 0.8, green: 0.2, blue: 0.8)
        default: return .yellow
        }
    }
    
    func getCategoryIconHENUF3958F35JF035(for category: String) -> String {
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
        ZStack {
            animatedBackgroundHENUF3958F35JF035
            
            if allFactsHENUF3958F35JF035.isEmpty {
                ProgressView("Loading...")
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
            } else if displayedFactsHENUF3958F35JF035.isEmpty && showSavedOnlyHENUF3958F35JF035 {
                // Немає збережених фактів
                VStack(spacing: isIPadHENUF3958F35JF035 ? 30 : 20) {
                    Image(systemName: "heart.slash.fill")
                        .font(.system(size: isIPadHENUF3958F35JF035 ? 80 : 60))
                        .foregroundColor(.red.opacity(0.5))
                    
                    Text("No Saved Facts")
                        .font(isIPadHENUF3958F35JF035 ? .title : .title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("Tap the heart to save a fact")
                        .font(isIPadHENUF3958F35JF035 ? .body : .caption)
                        .foregroundColor(.white.opacity(0.6))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, isIPadHENUF3958F35JF035 ? 60 : 30)
                    
                    Button(action: {
                        withAnimation {
                            showSavedOnlyHENUF3958F35JF035 = false
                            if !allFactsHENUF3958F35JF035.isEmpty {
                                currentFactIndexHENUF3958F35JF035 = 0
                                currentFactHENUF3958F35JF035 = allFactsHENUF3958F35JF035[0]
                            }
                        }
                    }) {
                        Text("Show All Facts")
                            .font(isIPadHENUF3958F35JF035 ? .title3 : .body)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(isIPadHENUF3958F35JF035 ? 20 : 15)
                            .background(Color.blue.opacity(0.3))
                            .cornerRadius(isIPadHENUF3958F35JF035 ? 15 : 12)
                    }
                }
                .padding()
            } else if let factHENUF3958F35JF035 = currentFactHENUF3958F35JF035 {
                VStack(spacing: 0) {
                    // Header з навігацією та фільтрами
                    HStack {
                        // Кнопка вибору категорії
                        Button(action: {
                            showCategoryPickerHENUF3958F35JF035 = true
                        }) {
                            HStack(spacing: 8) {
                                Image(systemName: selectedCategoryHENUF3958F35JF035 != nil ? "line.3.horizontal.decrease.circle.fill" : "line.3.horizontal.decrease.circle")
                                    .font(.system(size: isIPadHENUF3958F35JF035 ? 24 : 20))
                                if let categoryHENUF3958F35JF035 = selectedCategoryHENUF3958F35JF035 {
                                    Text(categoryHENUF3958F35JF035)
                                        .font(isIPadHENUF3958F35JF035 ? .body : .caption)
                                        .fontWeight(.semibold)
                                        .lineLimit(1)
                                }
                            }
                            .foregroundColor(selectedCategoryHENUF3958F35JF035 != nil ? categoryColorHENUF3958F35JF035 : .white.opacity(0.7))
                            .padding(.horizontal, isIPadHENUF3958F35JF035 ? 16 : 12)
                            .padding(.vertical, isIPadHENUF3958F35JF035 ? 10 : 8)
                            .background(
                                RoundedRectangle(cornerRadius: isIPadHENUF3958F35JF035 ? 20 : 15)
                                    .fill(selectedCategoryHENUF3958F35JF035 != nil ? categoryColorHENUF3958F35JF035.opacity(0.2) : Color.white.opacity(0.1))
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: isIPadHENUF3958F35JF035 ? 20 : 15)
                                    .stroke(selectedCategoryHENUF3958F35JF035 != nil ? categoryColorHENUF3958F35JF035.opacity(0.5) : Color.white.opacity(0.2), lineWidth: 1)
                            )
                        }
                        
                        Spacer()
                        
                        // Кнопка фільтра збережених
                        Button(action: {
                            withAnimation {
                                showSavedOnlyHENUF3958F35JF035.toggle()
                                // Оновлюємо індекс після зміни фільтра
                                if !displayedFactsHENUF3958F35JF035.isEmpty {
                                    currentFactIndexHENUF3958F35JF035 = 0
                                    currentFactHENUF3958F35JF035 = displayedFactsHENUF3958F35JF035[0]
                                } else {
                                    currentFactHENUF3958F35JF035 = nil
                                }
                            }
                        }) {
                            HStack(spacing: 8) {
                                Image(systemName: showSavedOnlyHENUF3958F35JF035 ? "heart.fill" : "heart")
                                    .font(.system(size: isIPadHENUF3958F35JF035 ? 20 : 18))
                                Text(showSavedOnlyHENUF3958F35JF035 ? "All" : "Saved")
                                    .font(isIPadHENUF3958F35JF035 ? .body : .caption)
                                    .fontWeight(.semibold)
                            }
                            .foregroundColor(showSavedOnlyHENUF3958F35JF035 ? .red : .white.opacity(0.7))
                            .padding(.horizontal, isIPadHENUF3958F35JF035 ? 16 : 12)
                            .padding(.vertical, isIPadHENUF3958F35JF035 ? 10 : 8)
                            .background(
                                RoundedRectangle(cornerRadius: isIPadHENUF3958F35JF035 ? 20 : 15)
                                    .fill(showSavedOnlyHENUF3958F35JF035 ? Color.red.opacity(0.2) : Color.white.opacity(0.1))
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: isIPadHENUF3958F35JF035 ? 20 : 15)
                                    .stroke(showSavedOnlyHENUF3958F35JF035 ? Color.red.opacity(0.5) : Color.white.opacity(0.2), lineWidth: 1)
                            )
                        }
                        
                        Spacer()
                        
                        // Кнопка збереження
                        Button(action: {
                            HapticManagerHENUF3958F35JF035.sharedHENUF3958F35JF035.impactHENUF3958F35JF035(styleHENUF3958F35JF035: .light)
                            toggleSaveFactHENUF3958F35JF035()
                        }) {
                            Image(systemName: savedFactsHENUF3958F35JF035.contains(factHENUF3958F35JF035.id) ? "heart.fill" : "heart")
                                .font(.system(size: isIPadHENUF3958F35JF035 ? 32 : 28))
                                .foregroundColor(savedFactsHENUF3958F35JF035.contains(factHENUF3958F35JF035.id) ? .red : .white.opacity(0.7))
                        }
                    }
                    .padding(isIPadHENUF3958F35JF035 ? 30 : 20)
                    .padding(.top, isIPadHENUF3958F35JF035 ? 20 : 10)
                    
                    Spacer()
                    
                    // Картка з фактом
                    VStack(spacing: isIPadHENUF3958F35JF035 ? 30 : 20) {
                        // Категорія з іконкою
                        HStack(spacing: 12) {
                            ZStack {
                                Circle()
                                    .fill(categoryColorHENUF3958F35JF035.opacity(0.2))
                                    .frame(width: isIPadHENUF3958F35JF035 ? 60 : 50, height: isIPadHENUF3958F35JF035 ? 60 : 50)
                                
                                Image(systemName: categoryIconHENUF3958F35JF035)
                                    .font(.system(size: isIPadHENUF3958F35JF035 ? 30 : 24))
                                    .foregroundColor(categoryColorHENUF3958F35JF035)
                            }
                            
                            Text(factHENUF3958F35JF035.categoryHENUF3958F35JF035)
                                .font(isIPadHENUF3958F35JF035 ? .system(size: 32) : .title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                            Spacer()
                        }
                        .padding(.horizontal, isIPadHENUF3958F35JF035 ? 40 : 25)
                        
                        // Факт в картці
                        ScrollView {
                            VStack(spacing: 20) {
                                Text(factHENUF3958F35JF035.factHENUF3958F35JF035)
                                    .font(isIPadHENUF3958F35JF035 ? .system(size: 36, weight: .medium) : .system(size: 24, weight: .medium))
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                    .lineSpacing(isIPadHENUF3958F35JF035 ? 10 : 8)
                                    .padding(isIPadHENUF3958F35JF035 ? 40 : 25)
                            }
                        }
                        .frame(maxHeight: isIPadHENUF3958F35JF035 ? 400 : 300)
                    }
                    .frame(maxWidth: isIPadHENUF3958F35JF035 ? 800 : .infinity)
                    .padding(isIPadHENUF3958F35JF035 ? 30 : 20)
                    .background(
                        RoundedRectangle(cornerRadius: isIPadHENUF3958F35JF035 ? 30 : 25)
                            .fill(Color.white.opacity(0.05))
                            .overlay(
                                RoundedRectangle(cornerRadius: isIPadHENUF3958F35JF035 ? 30 : 25)
                                    .stroke(
                                        LinearGradient(
                                            gradient: Gradient(colors: [
                                                categoryColorHENUF3958F35JF035.opacity(0.6),
                                                categoryColorHENUF3958F35JF035.opacity(0.3)
                                            ]),
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        ),
                                        lineWidth: 2
                                    )
                            )
                    )
                    .padding(.horizontal, isIPadHENUF3958F35JF035 ? 40 : 20)
                    .opacity(factOpacityHENUF3958F35JF035)
                    .offset(y: factOffsetHENUF3958F35JF035)
                    .scaleEffect(factScaleHENUF3958F35JF035)
                    .shadow(color: categoryColorHENUF3958F35JF035.opacity(0.3), radius: 20, x: 0, y: 10)
                    
                    Spacer()
                    
                    // Кнопки навігації
                    HStack(spacing: isIPadHENUF3958F35JF035 ? 20 : 15) {
                        // Кнопка попереднього
                        Button(action: {
                            HapticManagerHENUF3958F35JF035.sharedHENUF3958F35JF035.selectionHENUF3958F35JF035()
                            previousFactHENUF3958F35JF035()
                        }) {
                            HStack(spacing: 10) {
                                Image(systemName: "chevron.left")
                                    .font(.system(size: isIPadHENUF3958F35JF035 ? 24 : 20))
                                Text("Previous")
                                    .font(isIPadHENUF3958F35JF035 ? .title3 : .body)
                                    .fontWeight(.semibold)
                            }
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(isIPadHENUF3958F35JF035 ? 20 : 15)
                            .background(Color.white.opacity(0.1))
                            .overlay(
                                RoundedRectangle(cornerRadius: isIPadHENUF3958F35JF035 ? 15 : 12)
                                    .stroke(Color.white.opacity(0.2), lineWidth: 1)
                            )
                            .cornerRadius(isIPadHENUF3958F35JF035 ? 15 : 12)
                        }
                        .disabled(currentFactIndexHENUF3958F35JF035 == 0 || displayedFactsHENUF3958F35JF035.isEmpty)
                        .opacity((currentFactIndexHENUF3958F35JF035 == 0 || displayedFactsHENUF3958F35JF035.isEmpty) ? 0.5 : 1.0)
                        
                        // Кнопка наступного
                        Button(action: {
                            HapticManagerHENUF3958F35JF035.sharedHENUF3958F35JF035.selectionHENUF3958F35JF035()
                            nextFactHENUF3958F35JF035()
                        }) {
                            HStack(spacing: 10) {
                                Text("Next")
                                    .font(isIPadHENUF3958F35JF035 ? .title3 : .body)
                                    .fontWeight(.semibold)
                                Image(systemName: "chevron.right")
                                    .font(.system(size: isIPadHENUF3958F35JF035 ? 24 : 20))
                            }
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(isIPadHENUF3958F35JF035 ? 20 : 15)
                            .background(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        categoryColorHENUF3958F35JF035.opacity(0.8),
                                        categoryColorHENUF3958F35JF035.opacity(0.6)
                                    ]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .cornerRadius(isIPadHENUF3958F35JF035 ? 15 : 12)
                            .shadow(color: categoryColorHENUF3958F35JF035.opacity(0.4), radius: 10, x: 0, y: 5)
                        }
                    }
                    .padding(.horizontal, isIPadHENUF3958F35JF035 ? 40 : 20)
                    .padding(.bottom, isIPadHENUF3958F35JF035 ? 50 : 40)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            loadFactsHENUF3958F35JF035()
            // Завантажуємо збережені факти після завантаження всіх фактів
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                loadSavedFactsHENUF3958F35JF035()
            }
        }
        .onChange(of: allFactsHENUF3958F35JF035) { _ in
            // Перезавантажуємо збережені факти, коли змінюються всі факти
            if !allFactsHENUF3958F35JF035.isEmpty {
                loadSavedFactsHENUF3958F35JF035()
            }
        }
        .gesture(
            DragGesture()
                .onEnded { value in
                    if value.translation.width > 100 {
                        previousFactHENUF3958F35JF035()
                    } else if value.translation.width < -100 {
                        nextFactHENUF3958F35JF035()
                    }
                }
        )
        .sheet(isPresented: $showCategoryPickerHENUF3958F35JF035) {
            CategoryPickerViewHENUF3958F35JF035(
                categoriesHENUF3958F35JF035: availableCategoriesHENUF3958F35JF035,
                selectedCategoryHENUF3958F35JF035: $selectedCategoryHENUF3958F35JF035,
                onCategorySelectedHENUF3958F35JF035: { category in
                    selectedCategoryHENUF3958F35JF035 = category
                    // Оновлюємо поточний факт після вибору категорії
                    if !displayedFactsHENUF3958F35JF035.isEmpty {
                        currentFactIndexHENUF3958F35JF035 = 0
                        currentFactHENUF3958F35JF035 = displayedFactsHENUF3958F35JF035[0]
                    } else {
                        currentFactHENUF3958F35JF035 = nil
                    }
                },
                isIPadHENUF3958F35JF035: isIPadHENUF3958F35JF035
            )
        }
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
    
    func loadFactsHENUF3958F35JF035() {
        let randomFactsHENUF3958F35JF035 = QuestionDatabaseHENUF3958F35JF035.sharedHENUF3958F35JF035.getRandomFactsHENUF3958F35JF035(countHENUF3958F35JF035: 50)
        // Створюємо стабільні ID на основі тексту факту
        allFactsHENUF3958F35JF035 = randomFactsHENUF3958F35JF035.map { factHENUF3958F35JF035 in
            // Генеруємо стабільний UUID на основі тексту факту
            let stableIDHENUF3958F35JF035 = generateStableUUIDHENUF3958F35JF035(from: factHENUF3958F35JF035.factHENUF3958F35JF035)
            return FactHENUF3958F35JF035(id: stableIDHENUF3958F35JF035, factHENUF3958F35JF035: factHENUF3958F35JF035.factHENUF3958F35JF035, categoryHENUF3958F35JF035: factHENUF3958F35JF035.categoryHENUF3958F35JF035)
        }
        if !allFactsHENUF3958F35JF035.isEmpty {
            currentFactHENUF3958F35JF035 = allFactsHENUF3958F35JF035[0]
            currentFactIndexHENUF3958F35JF035 = 0
        }
    }
    
    func generateStableUUIDHENUF3958F35JF035(from string: String) -> UUID {
        // Створюємо стабільний UUID на основі хешу тексту
        let data = string.data(using: .utf8) ?? Data()
        var hash = [UInt8](repeating: 0, count: 16)
        data.withUnsafeBytes { bytes in
            for (index, byte) in bytes.enumerated() {
                hash[index % 16] ^= byte
            }
        }
        
        // Додаємо додатковий хеш для унікальності
        let stringHash = string.hashValue
        hash[0] ^= UInt8((stringHash >> 0) & 0xFF)
        hash[1] ^= UInt8((stringHash >> 8) & 0xFF)
        hash[2] ^= UInt8((stringHash >> 16) & 0xFF)
        hash[3] ^= UInt8((stringHash >> 24) & 0xFF)
        
        // Встановлюємо версію UUID (4) та варіант
        hash[6] = (hash[6] & 0x0F) | 0x40 // Версія 4
        hash[8] = (hash[8] & 0x3F) | 0x80 // Варіант
        
        let uuidString = String(format: "%02x%02x%02x%02x-%02x%02x-%02x%02x-%02x%02x-%02x%02x%02x%02x%02x%02x",
                               hash[0], hash[1], hash[2], hash[3],
                               hash[4], hash[5], hash[6], hash[7],
                               hash[8], hash[9], hash[10], hash[11],
                               hash[12], hash[13], hash[14], hash[15])
        
        return UUID(uuidString: uuidString) ?? UUID()
    }
    
    func loadSavedFactsHENUF3958F35JF035() {
        // Завантажуємо збережені тексти фактів з UserDefaults
        if let savedFactTextsHENUF3958F35JF035 = UserDefaults.standard.array(forKey: "likedFacts") as? [String] {
            // Знаходимо факти за текстом та зберігаємо їх ID
            savedFactsHENUF3958F35JF035 = Set()
            for factTextHENUF3958F35JF035 in savedFactTextsHENUF3958F35JF035 {
                if let factHENUF3958F35JF035 = allFactsHENUF3958F35JF035.first(where: { $0.factHENUF3958F35JF035 == factTextHENUF3958F35JF035 }) {
                    savedFactsHENUF3958F35JF035.insert(factHENUF3958F35JF035.id)
                }
            }
        }
    }
    
    func saveSavedFactsHENUF3958F35JF035() {
        // Зберігаємо тексти фактів (більш надійно, ніж UUID)
        let savedFactTextsHENUF3958F35JF035 = savedFactsHENUF3958F35JF035.compactMap { factIDHENUF3958F35JF035 in
            allFactsHENUF3958F35JF035.first(where: { $0.id == factIDHENUF3958F35JF035 })?.factHENUF3958F35JF035
        }
        UserDefaults.standard.set(savedFactTextsHENUF3958F35JF035, forKey: "likedFacts")
    }
    
    func toggleSaveFactHENUF3958F35JF035() {
        guard let factHENUF3958F35JF035 = currentFactHENUF3958F35JF035 else { return }
        
        let wasLikedHENUF3958F35JF035 = savedFactsHENUF3958F35JF035.contains(factHENUF3958F35JF035.id)
        
        if !wasLikedHENUF3958F35JF035 {
            HapticManagerHENUF3958F35JF035.sharedHENUF3958F35JF035.notificationHENUF3958F35JF035(typeHENUF3958F35JF035: .success)
        }
        
        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
            if wasLikedHENUF3958F35JF035 {
                savedFactsHENUF3958F35JF035.remove(factHENUF3958F35JF035.id)
            } else {
                savedFactsHENUF3958F35JF035.insert(factHENUF3958F35JF035.id)
            }
        }
        
        // Зберігаємо одразу після зміни
        saveSavedFactsHENUF3958F35JF035()
        
        // Оновлюємо поточний факт, якщо ми в режимі фільтрації збережених
        if showSavedOnlyHENUF3958F35JF035 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                if displayedFactsHENUF3958F35JF035.isEmpty {
                    // Якщо більше немає збережених фактів
                    currentFactHENUF3958F35JF035 = nil
                } else {
                    // Оновлюємо індекс, якщо поточний факт більше не в списку
                    if let currentHENUF3958F35JF035 = currentFactHENUF3958F35JF035, !displayedFactsHENUF3958F35JF035.contains(where: { $0.id == currentHENUF3958F35JF035.id }) {
                        if !displayedFactsHENUF3958F35JF035.isEmpty {
                            currentFactIndexHENUF3958F35JF035 = 0
                            currentFactHENUF3958F35JF035 = displayedFactsHENUF3958F35JF035[0]
                        } else {
                            currentFactHENUF3958F35JF035 = nil
                        }
                    }
                }
            }
        }
    }
    
    func nextFactHENUF3958F35JF035() {
        if displayedFactsHENUF3958F35JF035.isEmpty { return }
        
        // Анімація зникнення
        withAnimation(.easeOut(duration: 0.25)) {
            factOpacityHENUF3958F35JF035 = 0
            factOffsetHENUF3958F35JF035 = -30
            factScaleHENUF3958F35JF035 = 0.95
        }
        
        // Зміна факту
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            currentFactIndexHENUF3958F35JF035 = (currentFactIndexHENUF3958F35JF035 + 1) % displayedFactsHENUF3958F35JF035.count
            currentFactHENUF3958F35JF035 = displayedFactsHENUF3958F35JF035[currentFactIndexHENUF3958F35JF035]
            
            // Початковий стан для нової анімації
            factOffsetHENUF3958F35JF035 = 30
            factScaleHENUF3958F35JF035 = 0.95
            
            // Анімація появи
            withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                factOpacityHENUF3958F35JF035 = 1.0
                factOffsetHENUF3958F35JF035 = 0
                factScaleHENUF3958F35JF035 = 1.0
            }
        }
    }
    
    func previousFactHENUF3958F35JF035() {
        if displayedFactsHENUF3958F35JF035.isEmpty { return }
        
        // Анімація зникнення
        withAnimation(.easeOut(duration: 0.25)) {
            factOpacityHENUF3958F35JF035 = 0
            factOffsetHENUF3958F35JF035 = 30
            factScaleHENUF3958F35JF035 = 0.95
        }
        
        // Зміна факту
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            currentFactIndexHENUF3958F35JF035 = currentFactIndexHENUF3958F35JF035 == 0 ? displayedFactsHENUF3958F35JF035.count - 1 : currentFactIndexHENUF3958F35JF035 - 1
            currentFactHENUF3958F35JF035 = displayedFactsHENUF3958F35JF035[currentFactIndexHENUF3958F35JF035]
            
            // Початковий стан для нової анімації
            factOffsetHENUF3958F35JF035 = -30
            factScaleHENUF3958F35JF035 = 0.95
            
            // Анімація появи
            withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                factOpacityHENUF3958F35JF035 = 1.0
                factOffsetHENUF3958F35JF035 = 0
                factScaleHENUF3958F35JF035 = 1.0
            }
        }
    }
    
}

#Preview {
    FactsViewHENUF3958F35JF035()
}

