import SwiftUI

struct ContentView: View {
    @State private var text2=0.0
    @State private var text1=0.0
    @State private var znak=" "
    @State private var suma=0.0
    @State private var wynik=" "
    @State private var displayText = " "
    
    let decimalSeparator: String
   
    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 6
        return formatter
    }()

    init() {
            // Get the current locale's decimal separator
            let locale = Locale.current
            self.decimalSeparator = locale.decimalSeparator ?? "."
        }
    
    func digitButtonTapped(_ digit: String) {
        
        if displayText == " " || displayText=="E" || displayText=="0" && digit != "."{
            if( digit == "."){
                
            }else{
                
                    displayText = digit
                
            }
            
        }

        else {
            
            if(digit=="."){
                
                let text = displayText
                let characterToFind: Character = "."
                let characterFind: Character = ","

                if text.contains(characterToFind) || text.contains(characterFind) {
                    
                } else {
                    displayText += decimalSeparator
                }
                
            }else{
                
                 displayText += digit
                }
            
           
        }
        
        
    }
    
    func replaceCharacter(in text: String, target: Character, replacement: Character) -> String {
        return text.replacingOccurrences(of: String(target), with: String(replacement))
    }


    func operationButtonTapped(_ operation: String) {
        
            znak=operation
            if(text1==0){
                displayText = replaceCharacter(in: displayText, target: ",", replacement: ".")
                text1 = Float64(displayText) ?? 0
                print(text1)
                
            }
            else{
                text2=Float64(displayText) ?? 0
                print(text1)
                print(text2)
            }
            displayText=" "

        
    }
    
    func usuwanieOstatnie(_ text: inout String) {
        let dlugosc = text.count
        
        if text == "-" {
            text = "0"
        } else {
            if dlugosc == 1 {
                text = "0"
            } else {
                text = String(text.dropLast())
            }
        }
        
        if text1 == 0 {
            text1 = Double(text) ?? 0.0
        } else {
            text2 = Double(text) ?? 0.0
        }
    }

    

    func oblicz(_ wynik: String){
        displayText = replaceCharacter(in: displayText, target: ",", replacement: ".")
        text2=Float64(displayText) ?? 0
        
        if(text2==0 && znak=="/"){
            displayText="E"
            
        }
        else if(text1 != 0 && text2 != 0){
            
            if(znak=="/"){
                
                    suma = text1 / text2
                
                
            }
            else if(znak=="x"){
                suma = text1 * text2
            }
            else if(znak == "+"){
                suma = text1 + text2
            }
            else if(znak == "-"){
                suma = text1 - text2
                
            }
            text1 = suma
            text2 = 0
            print(suma)
            let integerValue = Int(text1)
            
            let hasDecimal = text1 - Double(integerValue) != 0
            
            displayText = numberFormatter.string(for: text1) ?? ""
            //displayText = String(format: "%g", text1)
            
        }
    }
    
    var body: some View {
        HStack {
            VStack {
                Text(displayText)
                    .font(.system(size: 70))
                    .multilineTextAlignment(.trailing)
                    .padding()
                
                HStack(spacing: 0) {
                    Button(" ") {
                        
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    .font(.system(size: 70))
                    
                    Spacer()
                    
                    Button(" ") {
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    .font(.system(size: 70))
                    
                    Spacer()
                    
                    Button("<-") {
                        usuwanieOstatnie(&displayText)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    .font(.system(size: 70))
                    
                    Spacer()
                    
                    Button("C") {
                        displayText=(" ")
                        text1=0
                        text2=0
                        znak=" "
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    .font(.system(size: 70))
                }
                
            }
            .padding()
        }
        
        
        
        
        HStack(spacing: 0) {
            Button("7") {
                self.digitButtonTapped("7")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
            .foregroundColor(.white)
            .cornerRadius(15)
            .font(.system(size: 70))
            
            Spacer()
            
            Button("8") {
                self.digitButtonTapped("8")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
            .foregroundColor(.white)
            .cornerRadius(15)
            .font(.system(size: 70))
            
            Spacer()
            
            Button("9") {
                self.digitButtonTapped("9")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
            .foregroundColor(.white)
            .cornerRadius(15)
            .font(.system(size: 70))
            
            Spacer()
            
            Button("/") {
                self.operationButtonTapped("/")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
            .foregroundColor(.white)
            .cornerRadius(15)
            .font(.system(size: 70))
        }
        .padding()
        
        HStack(spacing: 0) {
            Button("4") {
                self.digitButtonTapped("4")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
            .foregroundColor(.white)
            .cornerRadius(15)
            .font(.system(size: 70))
            
            Spacer()
            
            Button("5") {
                self.digitButtonTapped("5")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
            .foregroundColor(.white)
            .cornerRadius(15)
            .font(.system(size: 70))
            
            Spacer()
            
            Button("6") {
                self.digitButtonTapped("6")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
            .foregroundColor(.white)
            .cornerRadius(15)
            .font(.system(size: 70))
            
            Spacer()
            
            Button("x") {
                self.operationButtonTapped("x")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
            .foregroundColor(.white)
            .cornerRadius(15)
            .font(.system(size: 70))
        }
        .padding()
        
        HStack(spacing: 0) {
            Button("1") {
                self.digitButtonTapped("1")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
            .foregroundColor(.white)
            .cornerRadius(15)
            .font(.system(size: 70))
            
            Spacer()
            
            Button("2") {
                self.digitButtonTapped("2")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
            .foregroundColor(.white)
            .cornerRadius(15)
            .font(.system(size: 70))
            
            Spacer()
            
            Button("3") {
                self.digitButtonTapped("3")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
            .foregroundColor(.white)
            .cornerRadius(15)
            .font(.system(size: 70))
            
            Spacer()
            
            Button("-") {
                self.operationButtonTapped("-")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
            .foregroundColor(.white)
            .cornerRadius(15)
            .font(.system(size: 70))
        }
        .padding()
        
        HStack(spacing: 0) {
            Button("0") {
                self.digitButtonTapped("0")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
            .foregroundColor(.white)
            .cornerRadius(15)
            .font(.system(size: 70))
            
            Spacer()
            
            Button(decimalSeparator) {
                self.digitButtonTapped(".")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
            .foregroundColor(.white)
            .cornerRadius(15)
            .font(.system(size: 70))
            
            Spacer()
            
            Button("=") {
                self.oblicz("=")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
            .foregroundColor(.white)
            .cornerRadius(15)
            .font(.system(size: 70))
            
            Spacer()
            
            Button("+") {
                self.operationButtonTapped("+")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
            .foregroundColor(.white)
            .cornerRadius(15)
            .font(.system(size: 70))
        }
        .padding()
        
    }
    
}


#Preview {
    ContentView()
}
