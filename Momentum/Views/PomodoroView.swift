import SwiftUI

struct PomodoroView: View {
    @StateObject private var viewModel = PomodoroViewVM()
    @State private var selectedMinutes: Double = 25
    
    var body: some View {
        VStack(spacing: 30) {
            Spacer()

            VStack(spacing: 10) {
                Text("Select Duration")
                    .font(.headline)
                    .padding(.top)
                
                Slider(value: $selectedMinutes, in: 1...60, step: 1) {
                    Text("Select Duration")
                }
                .padding(.horizontal)
                .accentColor(.blue)
                
                Text("\(Int(selectedMinutes)) Minutes")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .padding(.top, 10)
            }
            .padding()
            .background(Color.blue.opacity(0.1))
            .cornerRadius(12)
            .shadow(radius: 5)
            .padding(.horizontal)
            
            Divider()
                .padding(.vertical)
            
            VStack(spacing: 10) {
                Text("Work Time")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.cyan)
                    .padding(.top, 20)
                
                Text(viewModel.formattedTimeString)
                    .font(.system(size: 72))
                    .fontWeight(.bold)
                    .foregroundColor(viewModel.isBreakTime ? .red : .green)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal)
            }
            .padding()
            .background(viewModel.isBreakTime ? Color.red.opacity(0.1) : Color.green.opacity(0.1))
            .cornerRadius(12)
            .shadow(radius: 5)
            .padding(.horizontal)
            
            Divider()
                .padding(.vertical)
            
            HStack(spacing: 30) {
                // Start/Pause button
                PomodoroButton(title: viewModel.isActive ? "Pause" : "Start",
                               backgroundColor: viewModel.isActive ? .orange : .blue,
                               action: viewModel.isActive ? viewModel.stopTimer : {
                                viewModel.startTimer(duration: selectedMinutes)
                               })

                // Reset button
                PomodoroButton(title: "Reset",
                               backgroundColor: .gray,
                               action: viewModel.resetTimer)
            }
            .padding(.horizontal)

            Spacer()
        }
        .padding()
        .background(viewModel.isBreakTime ? Color.red.opacity(0.1) : Color.green.opacity(0.1))
        .cornerRadius(20)
        .shadow(radius: 10)
        .navigationTitle("Pomodoro")
        .navigationBarTitleDisplayMode(.inline)
        .onChange(of: selectedMinutes) { newValue in
            viewModel.updateTimerDuration(duration: Int(newValue))
        }
    }
}

struct PomodoroButton: View {
    var title: String
    var backgroundColor: Color
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
                .padding()
                .frame(minWidth: 120)
                .background(backgroundColor)
                .foregroundColor(.white)
                .cornerRadius(12)
                .shadow(radius: 5)
        }
    }
}
