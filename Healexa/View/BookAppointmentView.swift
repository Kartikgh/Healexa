//
//  BookAppointmentView.swift
//  Healexa
//
//  Created by Karthik.Kurdekar on 04/02/25.
//

import SwiftUI

struct BookAppointmentView: View {
    @EnvironmentObject var router: NavigationRouter
    @State private var showDayPicker = false
    @State private var showMonthPicker = false
    @State private var showTimePicker = false
    @State private var selectedDay: Int = Calendar.current.component(.day, from: Date())
    @State private var selectedMonth: Int = Calendar.current.component(.month, from: Date())
    @State private var selectedTime: String = {
        let formatter = DateFormatter()
        formatter.dateFormat = Constants.dateFormatIdentifier.hh_mm_a
        return formatter.string(from: Date())
    }()
    
    @State private var selectedOption: String = Constants.onlineTitle
    
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constants.dateFormatIdentifier.mm_dd_yyy_hh_mm_a
        let currentYear = Calendar.current.component(.year, from: Date())
        let dateString = "\(selectedMonth)/\(selectedDay)/\(currentYear) \(selectedTime)"
        
        if let date = dateFormatter.date(from: dateString) {
            dateFormatter.dateFormat = Constants.dateFormatIdentifier.EEE_MMM_D_YYYY_H_MM_A
            return dateFormatter.string(from: date)
        }
        return ""
    }
    
    var body: some View {
        VStack {
            navBar()
            
            FixedSpacer(height: 35)

            ScrollView {
                VStack(alignment: .leading) {
                    Text(Constants.selecteDateAndTimeTitle)
                        .fontAndColor(name: AppFont.bold.name, size: AppFontSize.size20.value, color: Color.appColorHeaderTitle)

                    FixedSpacer(height: 25)
                    
                    // Custom Calendar Picker with buttons to show the pickers
                    CustomCalendarPickerView(selectedDay: $selectedDay, selectedMonth: $selectedMonth, selectedTime: $selectedTime,showDayPicker: $showDayPicker, showMonthPicker: $showMonthPicker, showTimePicker: $showTimePicker)
                    
                    FixedSpacer(height: 30)
                    
                    Text(Constants.reasonToVisitTitle)
                        .fontAndColor(name: AppFont.bold.name, size: AppFontSize.size20.value, color: Color.appColorHeaderTitle)
                    
                    FixedSpacer(height: 25)
                    
                    CustomDropdownView()

                    FixedSpacer(height: 30)

                    Text(Constants.appointmentTypeTitle)
                        .fontAndColor(name: AppFont.bold.name, size: AppFontSize.size20.value, color: Color.appColorHeaderTitle)
                    
                    FixedSpacer(height: 24)
                    
                    appointmentTypeButtonView()

                    FixedSpacer(height: 80)

                    receiptView()

                    bookNowButtonView()
                        .edgesIgnoringSafeArea(.bottom)

                    FixedSpacer()
                }
                .padding([.leading, .trailing], 20)
            }
        }
        .navigationBarHidden(true)
        
        .overlay(
            ZStack {
                if showDayPicker {
                    PopupBackground {
                        withAnimation {
                            showDayPicker = false
                        }
                    }
                    DayPickerPopupView(selectedDay: $selectedDay, isPresented: $showDayPicker)
                }
                
                if showMonthPicker {
                    PopupBackground {
                        withAnimation {
                            showMonthPicker = false
                        }
                    }
                    MonthPickerPopupView(selectedMonth: $selectedMonth, showMonthPicker: $showMonthPicker)
                }
                
                if showTimePicker {
                    PopupBackground {
                        withAnimation {
                            showTimePicker = false
                        }
                    }
                    TimePickerPopupView(selectedTime: $selectedTime, showTimePicker: $showTimePicker)
                }
            }
        )
    }
    
    @ViewBuilder
    private func navBar() -> some View {
        CustomNavBarView {
            Button(action: {
                router.pop()
            }) {
                Image(systemName: ImageAssetName.backIcon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .foregroundColor(.black)
                    .fontWeight(.bold)
            }
            .padding()
            .background(Color.appColorCardBg)
            .clipShape(Circle())
        } centerView: {
            Text(Constants.bookAppointmentTitle)
                .fontAndColor(name: AppFont.bold.name, size: AppFontSize.size20.value, color: Color.appColorHeaderTitle)
        }
    }
    
    @ViewBuilder
    private func appointmentTypeButtonView() -> some View {
        HStack {
            Button(action: {
                selectedOption = Constants.onlineTitle
            }) {
                Text(Constants.onlineTitle)
                    .fontAndColor(name: AppFont.bold.name, size: AppFontSize.size14.value, color: selectedOption == Constants.onlineTitle ? Color.appColorAA97C9  : Color.black)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .frame(height: 35)
                    .multilineTextAlignment(.center)
                    .padding(10)
                    .background(selectedOption == Constants.onlineTitle ? Color.appColorF2EFFA  : Color.appColorEAEAEA)
                    .cornerRadius(8)
            }

            FixedSpacer()

            Button(action: {
                selectedOption = Constants.inPersonTitle
            }) {
                Text(Constants.inPersonTitle)
                    .fontAndColor(name: AppFont.bold.name, size: AppFontSize.size14.value, color: selectedOption == Constants.inPersonTitle ? Color.appColorAA97C9  : Color.black)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .frame(height: 35)
                    .multilineTextAlignment(.center)
                    .padding(10)
                    .background(selectedOption == Constants.inPersonTitle ? Color.appColorF2EFFA  : Color.appColorEAEAEA)
                    .cornerRadius(8)
            }
        }
    }
    
    @ViewBuilder
    private func receiptView() -> some View {
        VStack {
            HStack {
                FixedSpacer()
                Text(Constants.doctorFeeTitle)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .fontAndColor(name: AppFont.medium.name, size: AppFontSize.size16.value, color: Color.gray)
                Text("18$")
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .fontAndColor(name: AppFont.medium.name, size: AppFontSize.size16.value, color: Color.gray)
                FixedSpacer()
            }

            FixedSpacer(height: 10)

            HStack {
                FixedSpacer()
                Text("Platform Fee")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .fontAndColor(name: AppFont.medium.name, size: AppFontSize.size16.value, color: Color.gray)
                Text("0.2$")
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .fontAndColor(name: AppFont.medium.name, size: AppFontSize.size16.value, color: Color.gray)
                FixedSpacer()
            }

            FixedSpacer(height: 10)
            Divider()
                .frame(height: 0.5)
                .background(Color.gray.opacity(0.5))

            FixedSpacer(height: 10)

            HStack {
                FixedSpacer()
                Text(Constants.totalCostTitle)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .fontAndColor(name: AppFont.bold.name, size: AppFontSize.size18.value, color: Color.appColorHeaderTitle)
                Text("20$")
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .fontAndColor(name: AppFont.bold.name, size: AppFontSize.size18.value, color: Color.appColorHeaderTitle)
                FixedSpacer()
            }
        }
    }
    
    @ViewBuilder
    private func bookNowButtonView() -> some View {
        VStack {
            FixedSpacer()

            Button(action: {
                router.popToRoot()
            }) {
                Text(Constants.bookNowButtonTitle)
                    .fontAndColor(name: AppFont.bold.name, size: AppFontSize.size18.value, color: Color(.white))
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.appColor6C4BA4)
                    .cornerRadius(10)
            }
            .padding(.top, 20)
        }
    }
}

struct DayPickerPopupView: View {
    @Binding var selectedDay: Int
    @Binding var isPresented: Bool

    private let days = Array(1...31)

    var body: some View {
        VStack {
            Text(Constants.selectDayTitle)
                .fontAndColor(name: AppFont.bold.name, size: AppFontSize.size18.value, color: Color.appColorHeaderTitle)
                .padding(.top)
            
            Picker(Constants.selectDayTitle, selection: $selectedDay) {
                ForEach(days, id: \.self) { day in
                    Text("\(day)").tag(day)
                }
            }
            .pickerStyle(WheelPickerStyle())
            .frame(height: 150)
            
            Button(action: {
                withAnimation {
                    isPresented.toggle()
                }
            }) {
                Text(Constants.doneTitle)
                    .fontAndColor(name: AppFont.bold.name, size: AppFontSize.size18.value, color: .white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.appColor6C4BA4)
                    .cornerRadius(10)
            }
            .padding()
        }
        .frame(width: 300, height: 300)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 10)
    }
}

import SwiftUI

struct MonthPickerPopupView: View {
    @Binding var selectedMonth: Int
    @Binding var showMonthPicker: Bool
    private let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    
    var body: some View {
        VStack {
            Text(Constants.selectMonthTitle)
                .fontAndColor(name: AppFont.bold.name, size: AppFontSize.size18.value, color: Color.appColorHeaderTitle)
                .padding(.top)
            
            Picker(Constants.selectMonthTitle, selection: $selectedMonth) {
                ForEach(0..<months.count, id: \.self) { index in
                    Text(months[index])
                        .tag(index + 1)
                }
            }
            .pickerStyle(WheelPickerStyle())
            .frame(height: 150)
            
            Button(action: {
                withAnimation {
                    showMonthPicker.toggle()
                }
            }) {
                Text(Constants.doneTitle)
                    .fontAndColor(name: AppFont.bold.name, size: AppFontSize.size18.value, color: .white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.appColor6C4BA4)
                    .cornerRadius(10)
            }
            .padding()
        }
        .frame(width: 300, height: 300)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 10)
    }
}


import SwiftUI

struct TimePickerPopupView: View {
    @Binding var selectedTime: String
    @Binding var showTimePicker: Bool
    private let dateFormatter: DateFormatter

    init(selectedTime: Binding<String>, showTimePicker: Binding<Bool>) {
        self._selectedTime = selectedTime
        self._showTimePicker = showTimePicker
        self.dateFormatter = DateFormatter()
        self.dateFormatter.dateFormat = Constants.dateFormatIdentifier.hh_mm_a
    }
    
    var body: some View {
        VStack {
            
            Text(Constants.selectTimeTitle)
                .fontAndColor(name: AppFont.bold.name, size: AppFontSize.size18.value, color: Color.appColorHeaderTitle)
                .padding(.top)
            
            FixedSpacer(height: 30)
            
            DatePicker(
                Constants.selectTimeTitle,
                selection: Binding(
                    get: {
                        return self.convertStringToDate(self.selectedTime) ?? Date()
                    },
                    set: { newValue in
                        self.selectedTime = self.convertDateToString(newValue)
                    }
                ),
                displayedComponents: .hourAndMinute
            )
            .labelsHidden()
            .padding()
            .datePickerStyle(WheelDatePickerStyle())
            .frame(height: 150)
            
            FixedSpacer(height: 30)
            
            Button(action: {
                withAnimation {
                    showTimePicker.toggle()
                }
            }) {
                Text(Constants.doneTitle)
                    .fontAndColor(name: AppFont.bold.name, size: AppFontSize.size18.value, color: .white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.appColor6C4BA4)
                    .cornerRadius(10)
            }
            .padding()
            
        }
        .frame(width: 300, height: 350)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 10)
    }
    
    // Helper function to convert String to Date
    private func convertStringToDate(_ timeString: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = Constants.dateFormatIdentifier.hh_mm_a
        return formatter.date(from: timeString)
    }

    // Helper function to convert Date to String
    private func convertDateToString(_ date: Date) -> String {
        return dateFormatter.string(from: date)
    }
}


import SwiftUI

struct CustomCalendarPickerView: View {
    @Binding var selectedDay: Int
    @Binding var selectedMonth: Int
    @Binding var selectedTime: String

    @Binding var showDayPicker: Bool
    @Binding var showMonthPicker: Bool
    @Binding var showTimePicker: Bool
    
    var body: some View {
        HStack(spacing: 20) {
            
            // Day Picker Button
            VStack(alignment: .center) {
                Text(Constants.dayTitle)
                    .fontAndColor(name: AppFont.bold.name, size: AppFontSize.size14.value, color: Color.appColorHeaderTitle)
                
                FixedSpacer(height: 6)
                VStack {
                    HStack {
                        Text(String(format: "%02d", selectedDay))
                            .fontAndColor(name: AppFont.bold.name, size: AppFontSize.size16.value, color: Color.appColorHeaderTitle)
                            .cornerRadius(20)
                    }
                    
                }
                .padding(10)
                .background(Color.appColorEAEAEA)
                .cornerRadius(4)
                .onTapGesture {
                    withAnimation {
                        showDayPicker.toggle()
                    }
                }
                
            }
            .frame(width: 60, height: 80)
            .background(Color.appColorF7F7F7)
            .cornerRadius(10)

            // Month Picker Button
            VStack(alignment: .center) {
                Text(Constants.monthTitle)
                    .fontAndColor(name: AppFont.bold.name, size: AppFontSize.size14.value, color: Color.appColorHeaderTitle)
                
                FixedSpacer(height: 6)
                VStack {
                    HStack {
                        Text(String(format: "%02d", selectedMonth))
                            .fontAndColor(name: AppFont.bold.name, size: AppFontSize.size16.value, color: Color.white)
                            .cornerRadius(20)
                    }
                    
                }
                .padding(10)
                .background(Color.appColor6C4BA4)
                .cornerRadius(4)
                .onTapGesture {
                    withAnimation {
                        showMonthPicker.toggle()
                    }
                }
            }
            .frame(width: 60, height: 80)
            .background(Color.appColorF7F7F7)
            .cornerRadius(10)

            // Time Picker Button
            VStack(alignment: .leading) {
                Text(Constants.timeTitle)
                    .fontAndColor(name: AppFont.bold.name, size: AppFontSize.size14.value, color: Color.appColorHeaderTitle)
                
                FixedSpacer(height: 6)
                VStack {
                    HStack {
                        Text(selectedTime)
                            .fontAndColor(name: AppFont.bold.name, size: AppFontSize.size16.value, color: Color.appColorHeaderTitle)
                    }
                    
                }
                .padding(10)
                .background(Color.appColorEAEAEA)
                .cornerRadius(4)
                .onTapGesture {
                    withAnimation {
                        showTimePicker.toggle()
                    }
                }
            }
            .padding()
            .frame(height: 80)
            .background(Color.appColorF7F7F7)
            .cornerRadius(10)

        }
    }
}


import SwiftUI

struct CustomDropdownView: View {
    @State private var selectedItem: String? = nil
    @State private var isDropdownVisible: Bool = false
    @State private var textFieldInput: String = ""
    private let items: [String] = ["General Consultation", "Skin Checkup", "Acne Treatment", "Eye Bags Treatment", "Hair Loss Consultation", "Cosmetic Procedures", "Follow-up Appointment", "Routine Checkup"]
    
    var body: some View {
        VStack {
            HStack {
                TextField(Constants.followUpTitle, text: $textFieldInput)
                    .padding(15)
                    .background(Color.appColorCardBg)
                    .cornerRadius(8)
                    .fontAndColor(name: AppFont.bold.name, size: AppFontSize.size14.value, color: Color.black)
                    .disabled(true)
                
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        isDropdownVisible.toggle()
                    }
                }) {
                    Image(systemName: isDropdownVisible ? ImageAssetName.chevronUp : ImageAssetName.chevronDown)
                        .fontWeight(.bold)
                        .padding()
                        .background(Color.appColor6C4BA4)
                        .foregroundColor(.white)
                        .cornerRadius(4)
                }
                .padding(.trailing)
            }
            
            if isDropdownVisible {
                VStack(spacing: 5) {
                    ForEach(items, id: \.self) { item in
                        Button(action: {
                            selectedItem = item
                            textFieldInput = item
                            withAnimation(.easeInOut(duration: 0.3)) {
                                isDropdownVisible = false
                            }
                        }) {
                            Text(item)
                                .padding(12)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color.white)
                                .cornerRadius(8)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .medium))
                        }
                    }
                }
                .background(Color.white)
                .cornerRadius(8)
                .shadow(radius: 5)
                .padding(.trailing)
                .zIndex(1)
            }
        }
    }
}
