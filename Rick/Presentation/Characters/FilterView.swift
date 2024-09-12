import SwiftUI

struct FilterView: View {
    @Binding var selectedStatus: String?
    @Binding var selectedGender: String?
    @Environment(\.presentationMode) var presentationMode

    let statusOptions = ["Alive", "Dead", "Unknown"]
    let genderOptions = ["Male", "Female", "Genderless", "Unknown"]

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Close")
                        .foregroundColor(.white)
                }
                Spacer()
                Text("Filters")
                    .foregroundColor(.white)
                    .font(.headline)
                Spacer()
                Button(action: {
                    selectedStatus = nil
                    selectedGender = nil
                }) {
                    Text("Reset")
                        .foregroundColor(.white)
                }
            }
            .padding()
            .background(Color.gray.opacity(0.2))

            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(statusOptions, id: \.self) { status in
                        Button(action: {
                            selectedStatus = status
                        }) {
                            Text(status)
                                .padding()
                                .background(selectedStatus == status ? Color.white : Color.clear)
                                .cornerRadius(15)
                        }
                    }
                }
                .padding()
            }

            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(genderOptions, id: \.self) { gender in
                        Button(action: {
                            selectedGender = gender
                        }) {
                            Text(gender)
                                .padding()
                                .background(selectedGender == gender ? Color.white : Color.clear)
                                .cornerRadius(15)
                        }
                    }
                }
                .padding()
            }

            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Apply Filters")
                    .padding()
                    .frame(width: 320, height: 42)
                    .background(Color(UIColor(hexString: "#42B4CA")))
                    .foregroundColor(.white)
                    .cornerRadius(16)
            }
            .padding()
        }
        .background(Color.black)
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(selectedStatus: .constant(nil), selectedGender: .constant(nil))
    }
}
