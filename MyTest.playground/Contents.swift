var fullName = "Natalia Mikheeva"

var CharacterOfName: String {
    var letters = ""
    
    for item in fullName {
        if ("A"..."Z").contains(item) {
            letters += String(item)
        }
    }
    
    return letters
}

print(CharacterOfName)
