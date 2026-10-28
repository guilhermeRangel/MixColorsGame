import Foundation

// MARK: - GameRound

/// Holds the state of a single round: the target color and the player's picks.
public struct GameRound {
    public let targetColor: MixedColor
    public internal(set) var firstSelection: GameColor?
    public internal(set) var secondSelection: GameColor?

    /// `true` when the player has made both selections.
    public var isComplete: Bool {
        firstSelection != nil && secondSelection != nil
    }

    /// The color produced by the player's two selections, or `nil` if incomplete.
    public var result: MixedColor? {
        guard let first = firstSelection, let second = secondSelection else { return nil }
        return ColorMixer.mix(first, with: second)
    }

    /// Whether the player's mixed result matches the target.
    public var isCorrect: Bool {
        result == targetColor
    }
}

// MARK: - GameState

/// Manages overall game progression: rounds, score, and per-round selections.
public final class GameState {

    // MARK: Public state

    public private(set) var score: Int = 0
    public private(set) var roundsPlayed: Int = 0
    public private(set) var currentRound: GameRound?

    // MARK: Init

    public init() {}

    // MARK: Round management

    /// Starts a new round with a randomly chosen target mixed color.
    public func startNewRound() {
        let targets: [MixedColor] = [.orange, .green, .purple]
        let target = targets.randomElement() ?? .orange
        currentRound = GameRound(targetColor: target)
    }

    /// Records the player's first color selection for the current round.
    public func selectFirst(_ color: GameColor) {
        currentRound?.firstSelection = color
    }

    /// Records the player's second selection, evaluates correctness, updates score.
    /// - Returns: `true` if the mixed result matches the target color.
    @discardableResult
    public func selectSecond(_ color: GameColor) -> Bool {
        currentRound?.secondSelection = color
        guard let round = currentRound else { return false }
        roundsPlayed += 1
        if round.isCorrect { score += 1 }
        return round.isCorrect
    }

    /// Resets all state to the initial values.
    public func reset() {
        score = 0
        roundsPlayed = 0
        currentRound = nil
    }
}
