import Foundation
import SpriteKit

public class GameSceneCredits: SKScene {

    // MARK: - Dependencies

    /// Injected navigator; defaults to the shared singleton for production use.
    public var navigator: SceneNavigating = SceneNavigator.shared

    // MARK: - Scene Lifecycle

    override public func didMove(to view: SKView) {
        // Credits scene is ready.
    }

    // MARK: - Touch Handling

    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        navigator.navigateToLogin(from: self)
    }

    override public func update(_ currentTime: TimeInterval) {
        // Reserved for per-frame updates.
    }
}
