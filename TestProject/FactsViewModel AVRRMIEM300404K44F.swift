//
//  FactsViewModel.swift


import Foundation
import SwiftUI
internal import Combine

@MainActor
final class FactsViewModelAVRRMIEM300404K44F: ObservableObject {
   // Змінні про НЛО
var ufoSpeedKmh = 12000
var ufoAltitudeMeters = 1500
var lightsColor = "green"
var isDetectedOnRadar = false
var crewCount = 3

// Функції
func appearInSky(location: String) {
    print("НЛО помічено над: \(location).")
}

func changeDirection(angle: Int) -> String {
    return "НЛО різко змінило курс на \(angle)°."
}

func toggleCloak() {
    
    print("Режим невидимості: \(!isDetectedOnRadar).")
}

func scanArea(radius: Int) {
    print("Проскановано зону радіусом \(radius) км.")
}

func departToSpace() {
    print("НЛО прискорилось і зникло в космосі.")
}







    @Published var currentFactAVRRMIEM300404K44F: FactAVRRMIEM300404K44F?
    @Published var currentFactIndexAVRRMIEM300404K44F: Int = 0
    @Published var isExpandedAVRRMIEM300404K44F: Bool = false
    
    private let factsServiceAVRRMIEM300404K44F = FactsServiceAVRRMIEM300404K44F()
    
    var totalFactsAVRRMIEM300404K44F: Int {
        factsServiceAVRRMIEM300404K44F.totalFactsCountAVRRMIEM300404K44F
    }
    
    func loadNextFactAVRRMIEM300404K44F() {
        currentFactAVRRMIEM300404K44F = factsServiceAVRRMIEM300404K44F.getNextFactAVRRMIEM300404K44F()
        currentFactIndexAVRRMIEM300404K44F = (currentFactIndexAVRRMIEM300404K44F + 1) % factsServiceAVRRMIEM300404K44F.totalFactsCountAVRRMIEM300404K44F
        isExpandedAVRRMIEM300404K44F = false // Reset expansion when loading new fact
    }
    
    func toggleExpansion() {
        isExpandedAVRRMIEM300404K44F.toggle()
    }
}

final class FactsServiceAVRRMIEM300404K44F {
    private let factsAVRRMIEM300404K44F: [FactAVRRMIEM300404K44F] = [
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "Honey never spoils.",
            fullDescriptionAVRRMIEM300404K44F: "Honey never spoils. Archaeologists have found 3000-year-old honey in Egyptian tombs that is still edible. This is because honey has a very low moisture content and high acidity, which creates an environment where bacteria and other microorganisms cannot survive. Additionally, honey contains hydrogen peroxide, which acts as a natural preservative."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "Octopuses have three hearts.",
            fullDescriptionAVRRMIEM300404K44F: "Octopuses have three hearts. Two pump blood to the gills, and one pumps it to the rest of the body. The two branchial hearts pump blood through the gills where it picks up oxygen, and the systemic heart pumps the oxygenated blood to the rest of the body. When an octopus swims, the systemic heart stops beating, which is why they prefer crawling to swimming."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "A day on Venus is longer than its year.",
            fullDescriptionAVRRMIEM300404K44F: "A day on Venus is longer than its year. Venus rotates so slowly on its axis that one day lasts 243 Earth days, while it takes only 225 Earth days to complete one orbit around the Sun. This means that a day on Venus is actually longer than its year! Additionally, Venus rotates in the opposite direction to most planets, a phenomenon known as retrograde rotation."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "Bananas are berries, but strawberries aren't.",
            fullDescriptionAVRRMIEM300404K44F: "Bananas are berries, but strawberries aren't. Botanically speaking, bananas qualify as berries because they develop from a single ovary and contain seeds. Strawberries, on the other hand, are actually aggregate fruits because they develop from multiple ovaries of a single flower. This classification is based on botanical definitions, not culinary ones, which is why it might seem counterintuitive."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "Wombat poop is cube-shaped.",
            fullDescriptionAVRRMIEM300404K44F: "Wombat poop is cube-shaped. This helps prevent their droppings from rolling away and marking their territory. This demonstrates the incredible diversity and complexity found in nature, science, and the world around us."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "Sharks have been around longer than trees.",
            fullDescriptionAVRRMIEM300404K44F: "Sharks have been around longer than trees. Sharks first appeared 400 million years ago, while trees appeared 350 million years ago. This demonstrates the incredible diversity and complexity found in nature, science, and the world around us."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "There are more possible games of chess than atoms in the observable universe.",
            fullDescriptionAVRRMIEM300404K44F: "There are more possible games of chess than atoms in the observable universe. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "A single cloud can weigh more than a million pounds.",
            fullDescriptionAVRRMIEM300404K44F: "A single cloud can weigh more than a million pounds. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "Dolphins have names for each other.",
            fullDescriptionAVRRMIEM300404K44F: "Dolphins have names for each other. They use signature whistles to identify themselves. This demonstrates the incredible diversity and complexity found in nature, science, and the world around us."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "The human brain contains approximately 86 billion neurons.",
            fullDescriptionAVRRMIEM300404K44F: "The human brain contains approximately 86 billion neurons. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "A group of flamingos is called a flamboyance.",
            fullDescriptionAVRRMIEM300404K44F: "A group of flamingos is called a flamboyance. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "Octopuses can change their color and texture to blend with their surroundings in milliseconds.",
            fullDescriptionAVRRMIEM300404K44F: "Octopuses can change their color and texture to blend with their surroundings in milliseconds. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "Polar bear fur is actually transparent, not white.",
            fullDescriptionAVRRMIEM300404K44F: "Polar bear fur is actually transparent, not white. Their skin is black. This demonstrates the incredible diversity and complexity found in nature, science, and the world around us."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "A day on Mercury lasts about 59 Earth days.",
            fullDescriptionAVRRMIEM300404K44F: "A day on Mercury lasts about 59 Earth days. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "Jupiter has at least 95 known moons, making it the planet with the most moons in our solar system.",
            fullDescriptionAVRRMIEM300404K44F: "Jupiter has at least 95 known moons, making it the planet with the most moons in our solar system. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "The speed of light is 299,792,458 meters per second.",
            fullDescriptionAVRRMIEM300404K44F: "The speed of light is 299,792,458 meters per second. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "An octopus has blue blood because it uses copper instead of iron to carry oxygen.",
            fullDescriptionAVRRMIEM300404K44F: "An octopus has blue blood because it uses copper instead of iron to carry oxygen. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "Honeybees can recognize human faces.",
            fullDescriptionAVRRMIEM300404K44F: "Honeybees can recognize human faces. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "A single strand of spaghetti is called a spaghetto.",
            fullDescriptionAVRRMIEM300404K44F: "A single strand of spaghetti is called a spaghetto. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "The shortest war in history lasted only 38 to 45 minutes between Britain and Zanzibar in 1896.",
            fullDescriptionAVRRMIEM300404K44F: "The shortest war in history lasted only 38 to 45 minutes between Britain and Zanzibar in 1896. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "The human nose can detect over 1 trillion different scents.",
            fullDescriptionAVRRMIEM300404K44F: "The human nose can detect over 1 trillion different scents. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "Polar bears have black skin under their white fur to absorb heat better.",
            fullDescriptionAVRRMIEM300404K44F: "Polar bears have black skin under their white fur to absorb heat better. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "Venus is the hottest planet in our solar system, even though Mercury is closer to the Sun.",
            fullDescriptionAVRRMIEM300404K44F: "Venus is the hottest planet in our solar system, even though Mercury is closer to the Sun. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "A single cloud can hold up to 500,000 pounds of water.",
            fullDescriptionAVRRMIEM300404K44F: "A single cloud can hold up to 500,000 pounds of water. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "The Earth's atmosphere extends about 10,000 kilometers into space.",
            fullDescriptionAVRRMIEM300404K44F: "The Earth's atmosphere extends about 10,000 kilometers into space. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "Neptune takes 165 Earth years to complete one orbit around the Sun.",
            fullDescriptionAVRRMIEM300404K44F: "Neptune takes 165 Earth years to complete one orbit around the Sun. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "The human heart pumps about 2,000 gallons of blood through the body every day.",
            fullDescriptionAVRRMIEM300404K44F: "The human heart pumps about 2,000 gallons of blood through the body every day. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "A group of owls is called a parliament.",
            fullDescriptionAVRRMIEM300404K44F: "A group of owls is called a parliament. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "The longest word in the English language has 189,819 letters and takes over 3 hours to pronounce.",
            fullDescriptionAVRRMIEM300404K44F: "The longest word in the English language has 189,819 letters and takes over 3 hours to pronounce. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "Dolphins sleep with one eye open.",
            fullDescriptionAVRRMIEM300404K44F: "Dolphins sleep with one eye open. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "The Great Wall of China is not visible from space with the naked eye, despite popular belief.",
            fullDescriptionAVRRMIEM300404K44F: "The Great Wall of China is not visible from space with the naked eye, despite popular belief. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "A day on Pluto lasts 6.4 Earth days.",
            fullDescriptionAVRRMIEM300404K44F: "A day on Pluto lasts 6.4 Earth days. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "Octopuses have eight arms and three hearts, but no bones.",
            fullDescriptionAVRRMIEM300404K44F: "Octopuses have eight arms and three hearts, but no bones. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "The human body produces about 25 million new cells every second.",
            fullDescriptionAVRRMIEM300404K44F: "The human body produces about 25 million new cells every second. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "A single lightning bolt can heat the air around it to 30,000°C (54,000°F).",
            fullDescriptionAVRRMIEM300404K44F: "A single lightning bolt can heat the air around it to 30,000°C (54,000°F). This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "Penguins can drink salt water because they have a special gland that filters out the salt.",
            fullDescriptionAVRRMIEM300404K44F: "Penguins can drink salt water because they have a special gland that filters out the salt. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "The human eye can distinguish about 10 million different colors.",
            fullDescriptionAVRRMIEM300404K44F: "The human eye can distinguish about 10 million different colors. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "A group of jellyfish is called a smack.",
            fullDescriptionAVRRMIEM300404K44F: "A group of jellyfish is called a smack. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "The coldest temperature ever recorded on Earth was -128.6°F (-89.2°C) in Antarctica.",
            fullDescriptionAVRRMIEM300404K44F: "The coldest temperature ever recorded on Earth was -128.6°F (-89.2°C) in Antarctica. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "Honeybees must visit about 2 million flowers to make one pound of honey.",
            fullDescriptionAVRRMIEM300404K44F: "Honeybees must visit about 2 million flowers to make one pound of honey. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "The human brain uses about 20% of the body's total energy.",
            fullDescriptionAVRRMIEM300404K44F: "The human brain uses about 20% of the body's total energy. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "A day on Mars is about 24 hours and 37 minutes, very similar to Earth.",
            fullDescriptionAVRRMIEM300404K44F: "A day on Mars is about 24 hours and 37 minutes, very similar to Earth. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "Octopuses have blue blood and three hearts.",
            fullDescriptionAVRRMIEM300404K44F: "Octopuses have blue blood and three hearts. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "The speed of sound is approximately 343 meters per second in air at room temperature.",
            fullDescriptionAVRRMIEM300404K44F: "The speed of sound is approximately 343 meters per second in air at room temperature. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "A single strand of human hair can support up to 100 grams in weight.",
            fullDescriptionAVRRMIEM300404K44F: "A single strand of human hair can support up to 100 grams in weight. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "Dolphins have been observed using tools, such as sponges to protect their noses while foraging.",
            fullDescriptionAVRRMIEM300404K44F: "Dolphins have been observed using tools, such as sponges to protect their noses while foraging. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "The human body contains enough iron to make a 3-inch nail.",
            fullDescriptionAVRRMIEM300404K44F: "The human body contains enough iron to make a 3-inch nail. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "A group of crows is called a murder.",
            fullDescriptionAVRRMIEM300404K44F: "A group of crows is called a murder. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "The deepest part of the ocean is the Mariana Trench, which is about 11 kilometers deep.",
            fullDescriptionAVRRMIEM300404K44F: "The deepest part of the ocean is the Mariana Trench, which is about 11 kilometers deep. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "Sharks have been on Earth for over 450 million years, predating dinosaurs.",
            fullDescriptionAVRRMIEM300404K44F: "Sharks have been on Earth for over 450 million years, predating dinosaurs. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "The human skeleton regenerates completely every 10 years.",
            fullDescriptionAVRRMIEM300404K44F: "The human skeleton regenerates completely every 10 years. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "A single cloud can weigh more than an elephant.",
            fullDescriptionAVRRMIEM300404K44F: "A single cloud can weigh more than an elephant. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "Octopuses can squeeze through openings as small as their beaks.",
            fullDescriptionAVRRMIEM300404K44F: "Octopuses can squeeze through openings as small as their beaks. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "The human brain processes visual information 60,000 times faster than text.",
            fullDescriptionAVRRMIEM300404K44F: "The human brain processes visual information 60,000 times faster than text. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "A day on Jupiter lasts only about 9 hours and 56 minutes.",
            fullDescriptionAVRRMIEM300404K44F: "A day on Jupiter lasts only about 9 hours and 56 minutes. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "Honeybees can fly up to 15 miles per hour.",
            fullDescriptionAVRRMIEM300404K44F: "Honeybees can fly up to 15 miles per hour. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "The human heart beats approximately 100,000 times per day.",
            fullDescriptionAVRRMIEM300404K44F: "The human heart beats approximately 100,000 times per day. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "A group of ravens is called an unkindness.",
            fullDescriptionAVRRMIEM300404K44F: "A group of ravens is called an unkindness. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "The largest known star, UY Scuti, could fit about 5 billion Suns inside it.",
            fullDescriptionAVRRMIEM300404K44F: "The largest known star, UY Scuti, could fit about 5 billion Suns inside it. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "Dolphins are one of the few animals that can recognize themselves in a mirror.",
            fullDescriptionAVRRMIEM300404K44F: "Dolphins are one of the few animals that can recognize themselves in a mirror. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "The human body has about 37 trillion cells.",
            fullDescriptionAVRRMIEM300404K44F: "The human body has about 37 trillion cells. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "A single lightning strike contains enough energy to power a 100-watt lightbulb for more than 3 months.",
            fullDescriptionAVRRMIEM300404K44F: "A single lightning strike contains enough energy to power a 100-watt lightbulb for more than 3 months. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "Octopuses have three hearts and blue blood due to copper-based hemocyanin.",
            fullDescriptionAVRRMIEM300404K44F: "Octopuses have three hearts and blue blood due to copper-based hemocyanin. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "The coldest natural temperature ever recorded on Earth was in Antarctica at -128.6°F.",
            fullDescriptionAVRRMIEM300404K44F: "The coldest natural temperature ever recorded on Earth was in Antarctica at -128.6°F. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "Honeybees communicate through a 'waggle dance' that tells other bees where to find food.",
            fullDescriptionAVRRMIEM300404K44F: "Honeybees communicate through a 'waggle dance' that tells other bees where to find food. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "The human brain can process an image in just 13 milliseconds.",
            fullDescriptionAVRRMIEM300404K44F: "The human brain can process an image in just 13 milliseconds. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "A day on Saturn is about 10 hours and 33 minutes.",
            fullDescriptionAVRRMIEM300404K44F: "A day on Saturn is about 10 hours and 33 minutes. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "Penguins can jump as high as 6 feet out of the water.",
            fullDescriptionAVRRMIEM300404K44F: "Penguins can jump as high as 6 feet out of the water. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "The human body produces about 1 to 1.5 liters of saliva every day.",
            fullDescriptionAVRRMIEM300404K44F: "The human body produces about 1 to 1.5 liters of saliva every day. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "A group of penguins on land is called a waddle, but in water they're called a raft.",
            fullDescriptionAVRRMIEM300404K44F: "A group of penguins on land is called a waddle, but in water they're called a raft. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "The hottest temperature ever recorded on Earth was 134°F (56.7°C) in Death Valley, California.",
            fullDescriptionAVRRMIEM300404K44F: "The hottest temperature ever recorded on Earth was 134°F (56.7°C) in Death Valley, California. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "Octopuses can regenerate lost arms, though the new arm may be shorter than the original.",
            fullDescriptionAVRRMIEM300404K44F: "Octopuses can regenerate lost arms, though the new arm may be shorter than the original. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "The human nose and ears never stop growing throughout a person's lifetime.",
            fullDescriptionAVRRMIEM300404K44F: "The human nose and ears never stop growing throughout a person's lifetime. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "A single cloud can contain millions of water droplets.",
            fullDescriptionAVRRMIEM300404K44F: "A single cloud can contain millions of water droplets. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "Dolphins have names for each other using signature whistles.",
            fullDescriptionAVRRMIEM300404K44F: "Dolphins have names for each other using signature whistles. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "The human brain contains about 100 billion neurons, the same as the number of stars in our galaxy.",
            fullDescriptionAVRRMIEM300404K44F: "The human brain contains about 100 billion neurons, the same as the number of stars in our galaxy. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "A day on Uranus lasts about 17 hours and 14 minutes.",
            fullDescriptionAVRRMIEM300404K44F: "A day on Uranus lasts about 17 hours and 14 minutes. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "Honeybees can see ultraviolet light, which helps them locate nectar on flowers.",
            fullDescriptionAVRRMIEM300404K44F: "Honeybees can see ultraviolet light, which helps them locate nectar on flowers. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "The human heart pumps blood through about 60,000 miles of blood vessels.",
            fullDescriptionAVRRMIEM300404K44F: "The human heart pumps blood through about 60,000 miles of blood vessels. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "A group of kangaroos is called a mob or troop.",
            fullDescriptionAVRRMIEM300404K44F: "A group of kangaroos is called a mob or troop. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "The deepest known point in Earth's oceans is the Challenger Deep in the Mariana Trench.",
            fullDescriptionAVRRMIEM300404K44F: "The deepest known point in Earth's oceans is the Challenger Deep in the Mariana Trench. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "Octopuses have no bones, allowing them to squeeze through tiny spaces.",
            fullDescriptionAVRRMIEM300404K44F: "Octopuses have no bones, allowing them to squeeze through tiny spaces. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "The human body sheds about 30,000 to 40,000 dead skin cells every minute.",
            fullDescriptionAVRRMIEM300404K44F: "The human body sheds about 30,000 to 40,000 dead skin cells every minute. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "A single lightning bolt can travel at speeds of up to 220,000 km/h.",
            fullDescriptionAVRRMIEM300404K44F: "A single lightning bolt can travel at speeds of up to 220,000 km/h. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "Penguins can hold their breath for up to 20 minutes underwater.",
            fullDescriptionAVRRMIEM300404K44F: "Penguins can hold their breath for up to 20 minutes underwater. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "The human brain weighs about 3 pounds but uses 20% of the body's energy.",
            fullDescriptionAVRRMIEM300404K44F: "The human brain weighs about 3 pounds but uses 20% of the body's energy. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "A day on Neptune lasts about 16 hours and 6 minutes.",
            fullDescriptionAVRRMIEM300404K44F: "A day on Neptune lasts about 16 hours and 6 minutes. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "Honeybees beat their wings 200 times per second.",
            fullDescriptionAVRRMIEM300404K44F: "Honeybees beat their wings 200 times per second. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "The human skeleton consists of 206 bones in adults.",
            fullDescriptionAVRRMIEM300404K44F: "The human skeleton consists of 206 bones in adults. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "A group of foxes is called a skulk or leash.",
            fullDescriptionAVRRMIEM300404K44F: "A group of foxes is called a skulk or leash. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "The speed of light in a vacuum is constant and represents the universal speed limit.",
            fullDescriptionAVRRMIEM300404K44F: "The speed of light in a vacuum is constant and represents the universal speed limit. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "Octopuses can taste with their arms, as they have taste receptors on their suckers.",
            fullDescriptionAVRRMIEM300404K44F: "Octopuses can taste with their arms, as they have taste receptors on their suckers. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "The human body contains enough carbon to fill about 9,000 pencils.",
            fullDescriptionAVRRMIEM300404K44F: "The human body contains enough carbon to fill about 9,000 pencils. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "A single cloud can be several miles wide and tall.",
            fullDescriptionAVRRMIEM300404K44F: "A single cloud can be several miles wide and tall. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "Dolphins sleep by resting one hemisphere of their brain at a time.",
            fullDescriptionAVRRMIEM300404K44F: "Dolphins sleep by resting one hemisphere of their brain at a time. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "The human brain generates about 12-25 watts of electricity, enough to power a low-wattage LED light.",
            fullDescriptionAVRRMIEM300404K44F: "The human brain generates about 12-25 watts of electricity, enough to power a low-wattage LED light. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "A day on Pluto lasts 6.4 Earth days due to its slow rotation.",
            fullDescriptionAVRRMIEM300404K44F: "A day on Pluto lasts 6.4 Earth days due to its slow rotation. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "Honeybees can recognize different human faces using pattern recognition.",
            fullDescriptionAVRRMIEM300404K44F: "Honeybees can recognize different human faces using pattern recognition. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "The human heart creates enough pressure to squirt blood 30 feet.",
            fullDescriptionAVRRMIEM300404K44F: "The human heart creates enough pressure to squirt blood 30 feet. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "A group of sharks is called a shiver or school.",
            fullDescriptionAVRRMIEM300404K44F: "A group of sharks is called a shiver or school. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "The largest living structure on Earth is the Great Barrier Reef, visible from space.",
            fullDescriptionAVRRMIEM300404K44F: "The largest living structure on Earth is the Great Barrier Reef, visible from space. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "Octopuses have nine brains - one central brain and one in each of their eight arms.",
            fullDescriptionAVRRMIEM300404K44F: "Octopuses have nine brains - one central brain and one in each of their eight arms. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "The human body produces about 2 to 4 pints of mucus every day.",
            fullDescriptionAVRRMIEM300404K44F: "The human body produces about 2 to 4 pints of mucus every day. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "A single lightning bolt can contain 1 billion volts of electricity.",
            fullDescriptionAVRRMIEM300404K44F: "A single lightning bolt can contain 1 billion volts of electricity. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "Penguins evolved from flying birds but lost the ability to fly millions of years ago.",
            fullDescriptionAVRRMIEM300404K44F: "Penguins evolved from flying birds but lost the ability to fly millions of years ago. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "The human brain processes about 70,000 thoughts per day.",
            fullDescriptionAVRRMIEM300404K44F: "The human brain processes about 70,000 thoughts per day. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "A day on Mercury lasts 59 Earth days, making it the longest day in our solar system.",
            fullDescriptionAVRRMIEM300404K44F: "A day on Mercury lasts 59 Earth days, making it the longest day in our solar system. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "Honeybees have five eyes - two large compound eyes and three smaller ocelli on top of their head.",
            fullDescriptionAVRRMIEM300404K44F: "Honeybees have five eyes - two large compound eyes and three smaller ocelli on top of their head. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "The human skeleton is completely replaced approximately every 10 years through bone remodeling.",
            fullDescriptionAVRRMIEM300404K44F: "The human skeleton is completely replaced approximately every 10 years through bone remodeling. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "A group of eagles is called a convocation or aerie.",
            fullDescriptionAVRRMIEM300404K44F: "A group of eagles is called a convocation or aerie. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "The deepest ocean trench could easily swallow Mount Everest with over a mile to spare.",
            fullDescriptionAVRRMIEM300404K44F: "The deepest ocean trench could easily swallow Mount Everest with over a mile to spare. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "Octopuses can change their color, texture, and shape to blend perfectly with their environment.",
            fullDescriptionAVRRMIEM300404K44F: "Octopuses can change their color, texture, and shape to blend perfectly with their environment. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "The human body is made up of about 60% water.",
            fullDescriptionAVRRMIEM300404K44F: "The human body is made up of about 60% water. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "A single cloud can weigh as much as a jumbo jet.",
            fullDescriptionAVRRMIEM300404K44F: "A single cloud can weigh as much as a jumbo jet. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "Dolphins use echolocation to 'see' with sound, similar to bats.",
            fullDescriptionAVRRMIEM300404K44F: "Dolphins use echolocation to 'see' with sound, similar to bats. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "The human brain is 75% water and contains about 100 billion neurons.",
            fullDescriptionAVRRMIEM300404K44F: "The human brain is 75% water and contains about 100 billion neurons. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "A day on Jupiter is the shortest of all planets, lasting less than 10 hours.",
            fullDescriptionAVRRMIEM300404K44F: "A day on Jupiter is the shortest of all planets, lasting less than 10 hours. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "Honeybees navigate using the sun as a compass, even on cloudy days.",
            fullDescriptionAVRRMIEM300404K44F: "Honeybees navigate using the sun as a compass, even on cloudy days. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "The human heart beats over 2.5 billion times in an average lifetime.",
            fullDescriptionAVRRMIEM300404K44F: "The human heart beats over 2.5 billion times in an average lifetime. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "A group of zebras is called a dazzle.",
            fullDescriptionAVRRMIEM300404K44F: "A group of zebras is called a dazzle. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "The Moon is moving away from Earth at a rate of about 3.8 centimeters per year.",
            fullDescriptionAVRRMIEM300404K44F: "The Moon is moving away from Earth at a rate of about 3.8 centimeters per year. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "Octopuses are considered one of the most intelligent invertebrates.",
            fullDescriptionAVRRMIEM300404K44F: "Octopuses are considered one of the most intelligent invertebrates. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "The human body contains enough phosphorus to make about 2,200 match heads.",
            fullDescriptionAVRRMIEM300404K44F: "The human body contains enough phosphorus to make about 2,200 match heads. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "A single lightning strike can be hotter than the surface of the sun.",
            fullDescriptionAVRRMIEM300404K44F: "A single lightning strike can be hotter than the surface of the sun. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "Penguins can drink salt water thanks to a special gland that removes excess salt.",
            fullDescriptionAVRRMIEM300404K44F: "Penguins can drink salt water thanks to a special gland that removes excess salt. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "The human brain can store approximately 2.5 petabytes of information.",
            fullDescriptionAVRRMIEM300404K44F: "The human brain can store approximately 2.5 petabytes of information. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "A day on Venus lasts longer than its year - 243 Earth days vs 225 Earth days.",
            fullDescriptionAVRRMIEM300404K44F: "A day on Venus lasts longer than its year - 243 Earth days vs 225 Earth days. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "Honeybees perform a 'waggle dance' to communicate the location of food sources to other bees.",
            fullDescriptionAVRRMIEM300404K44F: "Honeybees perform a 'waggle dance' to communicate the location of food sources to other bees. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "The human skeleton provides structure and protection for internal organs.",
            fullDescriptionAVRRMIEM300404K44F: "The human skeleton provides structure and protection for internal organs. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "A group of lions is called a pride.",
            fullDescriptionAVRRMIEM300404K44F: "A group of lions is called a pride. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "The speed of light is so fast that it can travel around Earth 7.5 times in one second.",
            fullDescriptionAVRRMIEM300404K44F: "The speed of light is so fast that it can travel around Earth 7.5 times in one second. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "Octopuses can solve puzzles, use tools, and even escape from enclosures.",
            fullDescriptionAVRRMIEM300404K44F: "Octopuses can solve puzzles, use tools, and even escape from enclosures. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "The human body produces new skin cells every 27 days.",
            fullDescriptionAVRRMIEM300404K44F: "The human body produces new skin cells every 27 days. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "A single cloud can produce lightning, rain, and hail simultaneously.",
            fullDescriptionAVRRMIEM300404K44F: "A single cloud can produce lightning, rain, and hail simultaneously. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "Dolphins have been known to help humans in distress, pushing them toward shore.",
            fullDescriptionAVRRMIEM300404K44F: "Dolphins have been known to help humans in distress, pushing them toward shore. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "The human brain contains approximately 100,000 miles of blood vessels.",
            fullDescriptionAVRRMIEM300404K44F: "The human brain contains approximately 100,000 miles of blood vessels. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "A day on Mars is very similar to Earth - 24 hours, 37 minutes, and 22 seconds.",
            fullDescriptionAVRRMIEM300404K44F: "A day on Mars is very similar to Earth - 24 hours, 37 minutes, and 22 seconds. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "Honeybees can fly at speeds of up to 15 miles per hour when carrying nectar.",
            fullDescriptionAVRRMIEM300404K44F: "Honeybees can fly at speeds of up to 15 miles per hour when carrying nectar. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "The human heart is roughly the size of a closed fist and weighs about 10 ounces.",
            fullDescriptionAVRRMIEM300404K44F: "The human heart is roughly the size of a closed fist and weighs about 10 ounces. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "A group of monkeys is called a troop or barrel.",
            fullDescriptionAVRRMIEM300404K44F: "A group of monkeys is called a troop or barrel. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "The largest volcano in our solar system is Olympus Mons on Mars, which is about 3 times taller than Mount Everest.",
            fullDescriptionAVRRMIEM300404K44F: "The largest volcano in our solar system is Olympus Mons on Mars, which is about 3 times taller than Mount Everest. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "Octopuses can change color in less than a second to communicate or camouflage.",
            fullDescriptionAVRRMIEM300404K44F: "Octopuses can change color in less than a second to communicate or camouflage. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "The human body contains enough fat to make about 7 bars of soap.",
            fullDescriptionAVRRMIEM300404K44F: "The human body contains enough fat to make about 7 bars of soap. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "A single lightning bolt can light a 100-watt lightbulb for more than 3 months.",
            fullDescriptionAVRRMIEM300404K44F: "A single lightning bolt can light a 100-watt lightbulb for more than 3 months. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "Penguins have a counter-shaded coloration - dark on top and light underneath - to avoid predators.",
            fullDescriptionAVRRMIEM300404K44F: "Penguins have a counter-shaded coloration - dark on top and light underneath - to avoid predators. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "The human brain processes information faster than any computer.",
            fullDescriptionAVRRMIEM300404K44F: "The human brain processes information faster than any computer. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "A day on Saturn takes about 10 hours and 33 minutes to complete.",
            fullDescriptionAVRRMIEM300404K44F: "A day on Saturn takes about 10 hours and 33 minutes to complete. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "Honeybees visit about 2 million flowers to produce one pound of honey.",
            fullDescriptionAVRRMIEM300404K44F: "Honeybees visit about 2 million flowers to produce one pound of honey. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
        FactAVRRMIEM300404K44F(
            shortDescriptionAVRRMIEM300404K44F: "The human skeleton protects vital organs like the brain, heart, and lungs.",
            fullDescriptionAVRRMIEM300404K44F: "The human skeleton protects vital organs like the brain, heart, and lungs. This fascinating fact reveals interesting details about the natural world and demonstrates the complexity and wonder of our universe."
        ),
    ]
    
    var totalFactsCountAVRRMIEM300404K44F: Int {
        factsAVRRMIEM300404K44F.count
    }
    
    private var currentIndexAVRRMIEM300404K44F: Int = 0
    
    func getNextFactAVRRMIEM300404K44F() -> FactAVRRMIEM300404K44F {
        // Shuffle if we've gone through all facts
        if currentIndexAVRRMIEM300404K44F >= factsAVRRMIEM300404K44F.count {
            currentIndexAVRRMIEM300404K44F = 0
        }
        
        let fact = factsAVRRMIEM300404K44F[currentIndexAVRRMIEM300404K44F]
        currentIndexAVRRMIEM300404K44F = (currentIndexAVRRMIEM300404K44F + 1) % factsAVRRMIEM300404K44F.count
        
        return fact
    }
}

