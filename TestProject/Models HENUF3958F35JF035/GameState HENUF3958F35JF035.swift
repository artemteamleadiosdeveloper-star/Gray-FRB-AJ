//
//  GameState.swift
//  TestProject
//
//  Created by Traffter on 08.02.2026.
//

import Foundation
internal import Combine


enum GameModeHENUF3958F35JF035 {
    
    case singlePlayerHENUF3958F35JF035
    case twoPlayerHENUF3958F35JF035
    case aiPlayerHENUF3958F35JF035
    case timeAttackHENUF3958F35JF035
}


class GameStateHENUF3958F35JF035: ObservableObject {
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

    
    @Published var currentQuestionIndexHENUF3958F35JF035: Int = 0
    @Published var scoreHENUF3958F35JF035: Int = 0
    @Published var livesHENUF3958F35JF035: Int = 3
    @Published var isGameOverHENUF3958F35JF035: Bool = false
    @Published var selectedAnswerHENUF3958F35JF035: Int? = nil
    @Published var showResultHENUF3958F35JF035: Bool = false
    @Published var gameModeHENUF3958F35JF035: GameModeHENUF3958F35JF035 = .singlePlayerHENUF3958F35JF035
    
    // Two player mode
    @Published var player1ScoreHENUF3958F35JF035: Int = 0
    @Published var player2ScoreHENUF3958F35JF035: Int = 0
    @Published var currentPlayerHENUF3958F35JF035: Int = 1
    @Published var player1QuestionsHENUF3958F35JF035: [QuestionHENUF3958F35JF035] = []
    @Published var player2QuestionsHENUF3958F35JF035: [QuestionHENUF3958F35JF035] = []
    @Published var player1CurrentIndexHENUF3958F35JF035: Int = 0
    @Published var player2CurrentIndexHENUF3958F35JF035: Int = 0
    
    // AI mode
    @Published var aiScoreHENUF3958F35JF035: Int = 0
    @Published var aiAnswersHENUF3958F35JF035: [Int] = []
    
    func resetHENUF3958F35JF035() {
        currentQuestionIndexHENUF3958F35JF035 = 0
        scoreHENUF3958F35JF035 = 0
        livesHENUF3958F35JF035 = 3
        isGameOverHENUF3958F35JF035 = false
        selectedAnswerHENUF3958F35JF035 = nil
        showResultHENUF3958F35JF035 = false
        player1ScoreHENUF3958F35JF035 = 0
        player2ScoreHENUF3958F35JF035 = 0
        currentPlayerHENUF3958F35JF035 = 1
        player1CurrentIndexHENUF3958F35JF035 = 0
        player2CurrentIndexHENUF3958F35JF035 = 0
        aiScoreHENUF3958F35JF035 = 0
        aiAnswersHENUF3958F35JF035 = []
    }
}



