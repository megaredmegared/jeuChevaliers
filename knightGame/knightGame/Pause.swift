class Pause {

    func toRead() {
        while true { // pause the text until return button is pressed
            if let _ = readLine() {
                break
            }
        }
    }
}
