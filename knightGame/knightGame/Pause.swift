class Pause {

    func toRead() {
        while true { // pause the text until a button is pressed
            if let _ = readLine() {
                break
            }
        }
    }
}
