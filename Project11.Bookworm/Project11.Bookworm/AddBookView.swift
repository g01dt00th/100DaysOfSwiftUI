import SwiftUI

struct AddBookView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = ""
    @State private var review = ""
    @State private var date = Date()
    
    var formatterDate: String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateStyle = .short
        let newDate = formatter.string(from: self.date)
        return newDate
    }
    
    let genres = [
        "Fantasy", "Horror", "Kids",
        "Mystery", "Poetry", "Romance",
        "Thriller"
    ]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section {
                    RatingView(rating: $rating)
                    
                    TextField("Write a review", text: $review)
                    
                    Text(formatterDate)
                }
                
                Section {
                    Button("Save") {
                        let newBook = Book(context: self.moc)
                        
                        if self.title.isEmpty {
                            self.title = "Default title"
                        }
                        
                        if self.author.isEmpty {
                            self.author = "Default author"
                        }
                        
                        if self.genre.isEmpty {
                            self.genre = "Fantasy"
                        }
                        
                        if self.review.isEmpty {
                            self.review = "Default review"
                        }
                        
                        newBook.title = self.title
                        newBook.author = self.author
                        newBook.rating = Int16(self.rating)
                        newBook.genre = self.genre
                        newBook.review = self.review
                        newBook.date = self.date
                        
                        try? self.moc.save()
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
            }
            .navigationBarTitle("Add Book")
        }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
