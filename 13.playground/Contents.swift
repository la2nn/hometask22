let status = "shiny"
for (position, character) in
    status.characters.reversed().enumerated() where position % 2 == 0 {
        print("\(position): \(character)")
}
