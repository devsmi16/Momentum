import Foundation
import SwiftUI
import Combine

class PomodoroViewVM: ObservableObject {
    @Published var timerDuration: Int = 25 // default time
    @Published var timeRemaining: Int = 0
    @Published var isActive: Bool = false
    @Published var isBreakTime: Bool = false
    @Published var isPaused: Bool = false

    private var timer: Timer?
    
    func startTimer(duration: Double) {
        self.timerDuration = Int(duration * 60)
        self.timeRemaining = timerDuration
        self.isActive = true
        self.isPaused = false

        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            } else {
                self.stopTimer()
                self.isBreakTime.toggle()
            }
        }
    }

    func stopTimer() {
        timer?.invalidate()
        isActive = false
        isPaused = true
    }

    func resetTimer() {
        stopTimer()
        self.timeRemaining = 0
        self.isBreakTime = false
    }

    var formattedTimeString: String {
        let minutes = timeRemaining / 60
        let seconds = timeRemaining % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }

    func updateTimerDuration(duration: Int) {
        self.timerDuration = duration
    }

    func currentTimerState() -> String {
        if isBreakTime {
            return "Break"
        } else {
            return "Work"
        }
    }
}
