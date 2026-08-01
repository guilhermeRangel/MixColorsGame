import Foundation
import SpriteKit

public class GameScenePlay: SKScene {

    // MARK: - Dependencies

    private let gameState = GameState()

    /// Injected navigator; defaults to the shared singleton for production use.
    public var navigator: SceneNavigating = SceneNavigator.shared

    // MARK: - Scene Lifecycle

    override public func didMove(to view: SKView) {
        gameState.startNewRound()
    }

    // MARK: - Touch Handling

    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let point    = touch.location(in: self)
        let nodeName = scene?.nodes(at: point).first?.name
        handleTap(on: nodeName)
    }

    // MARK: - Game Logic

    /// Processes a tap on a node identified by `nodeName`.
    /// Node names are expected to match `GameColor.nodeName` values.
    private func handleTap(on nodeName: String?) {
        guard let name = nodeName,
              let color = GameColor.allCases.first(where: { $0.nodeName == name }) else { return }

        if gameState.currentRound?.firstSelection == nil {
            gameState.selectFirst(color)
        } else {
            let correct = gameState.selectSecond(color)
            handleRoundResult(correct: correct)
        }
    }

    private func handleRoundResult(correct: Bool) {
        // Start next round regardless of outcome; callers can extend this for visual feedback.
        gameState.startNewRound()
    }

    override public func update(_ currentTime: TimeInterval) {
        // Reserved for per-frame updates.
    }
}
