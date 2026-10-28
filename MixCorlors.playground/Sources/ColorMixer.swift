import Foundation

// MARK: - GameColor

/// A primary color the player can choose during a round.
public enum GameColor: String, CaseIterable {
    case red
    case blue
    case yellow

    /// Display name used to identify SpriteKit nodes on screen.
    public var nodeName: String { rawValue.capitalized }
}

// MARK: - MixedColor

/// The result of combining two primary colors.
public enum MixedColor: Equatable {
    case orange    // red  + yellow
    case green     // blue + yellow
    case purple    // red  + blue
    case unknown

    public var name: String {
        switch self {
        case .orange:  return "Orange"
        case .green:   return "Green"
        case .purple:  return "Purple"
        case .unknown: return "Unknown"
        }
    }
}

// MARK: - ColorMixer

/// Stateless helper that mixes two primary `GameColor` values.
public enum ColorMixer {

    /// Returns the `MixedColor` produced by combining `first` and `second`.
    /// The order of the arguments does not affect the result.
    public static func mix(_ first: GameColor, with second: GameColor) -> MixedColor {
        switch (first, second) {
        case (.red, .yellow),  (.yellow, .red):   return .orange
        case (.blue, .yellow), (.yellow, .blue):  return .green
        case (.red, .blue),    (.blue, .red):      return .purple
        default:                                   return .unknown
        }
    }
}
