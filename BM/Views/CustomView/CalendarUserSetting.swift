//
//  CalendarUserSetting.swift
//  BM
//
//  Created by NikitaSergeevich on 19/10/2022.
//

import SwiftUI

struct CalendarUserSetting: View {
    
    var calendar = Calendar(identifier: .iso8601)
    @State var currnetDate: Date = Date()
    
    var body: some View {
//        ScrollView(.vertical, showsIndicators: false) {
        VStack(spacing: 20) {
            Image(systemName: "chevron.down")
                .resizable()
                .frame(width: 40, height: 8)
                .foregroundColor(.gray)
                .padding(.top, 5)
                .padding(.bottom, -10)
                CustomDatePickerUserSetting(currentDate: $currnetDate)
            }
//        }
        
    }
}

struct CustomDatePickerUserSetting: View {
    var calendar = Calendar(identifier: .iso8601)
    
    @Binding var currentDate: Date
    
    @State var currentMonth: Int = 0
    
    var body: some View {
        ScrollView {
            VStack(spacing: 35) {
                let days: [String] = [ "mon", "tue", "wed", "thu", "fri", "sat", "sun" ]
                let columns = Array(repeating: GridItem(.flexible()), count: 7)
                
// MARK: title
               
                HStack(spacing: 10) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text(extraDate()[1])
                            .font(.title.bold())
                        Text(extraDate()[0])
                            .font(.caption)
                            .fontWeight(.semibold)
                    }
                    Spacer(minLength: 0)
                    Button{
                        currentMonth -= 1
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .foregroundColor(Color("CBlue"))
                    }
                    Button{
                        currentMonth += 1
                    } label: {
                        Image(systemName: "chevron.right")
                            .font(.title2)
                            .foregroundColor(Color("CBlue"))
                    }
                    
                }
                .padding(.horizontal)
                
                HStack(spacing: 0) {
                    ForEach(days, id: \.self) { day in
                        Text(day)
                            .font(.callout)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                    }
                }
                
// MARK: calendar
                LazyVGrid(columns: columns, spacing: 15) {
                    ForEach(extractDate()){ val in
                        CardView(val: val)
                    }
                }
                
// MARK:  hourle picker
                VStack {
                    Divider()
                    
                    Button {
                        // action for add
                    } label: {
                        Spacer()
                        Text("Add")
                        Image(systemName: "plus")
                    }
                    .bold()
                    .foregroundColor(.gray)
                    .padding(.trailing)
                    
                    
                    
                    ForEach(9...18, id: \.self) { hour in
                        if hour == 9 || hour == 10 {
                            HStack {
                                Circle()
                                    .frame(width: 10)
                                    .foregroundColor(Color(.systemPink))
                                Text("\(currentDate.formatted())")
                                Text("Busy")
                                    .foregroundColor(Color(.systemPink))
                                Spacer()
                                Button {
                                    // action for edit
                                } label: {
                                    Image(systemName: "pencil")
                                        .padding(.trailing)
                                }
                                .foregroundColor(.gray)
                            }
                            .padding(5)
                            Divider()
                                .padding(.trailing, 50)
                        } else if hour == 11 || hour == 12 {
                            HStack {
                                Circle()
                                    .frame(width: 10)
                                    .foregroundColor(Color("CGreen"))
                                Text("\(currentDate.formatted())")
                                Text("Free")
                                    .foregroundColor(Color("CGreen"))
                                Spacer()
                            }
                            .padding(5)
                            Divider()
                                .padding(.trailing, 50)
                        }
                    }
                }
                
            }
            .onChange(of: currentMonth) { newValue in
                currentDate = getCurrentMonth()
            }
        }
    }
    
    
    
    private func extraDate() -> [String] {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY MMMM"
        let date = formatter.string(from:  currentDate)
        return date.components(separatedBy: " ")
    }
    
    private func getCurrentMonth()-> Date {
        
        let calendar = Calendar(identifier: .iso8601)
        
        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to: calendar.dateInterval(of: .month, for: Date())!.start) else {
            return Date()
        }
        
        return currentMonth
    }
    
    private func days(for month: Date) -> [Date] {
        let calendar = Calendar(identifier: .iso8601)

        guard
            let monthInterval = calendar.dateInterval(of: .month, for: month),
            let monthFirstWeek = calendar.dateInterval(of: .weekOfMonth, for: monthInterval.start),
            let monthLastWeek = calendar.dateInterval(of: .weekOfMonth, for: monthInterval.end)
        else { return [] }

        return calendar.generateDates(
            inside: DateInterval(start: monthFirstWeek.start, end: monthLastWeek.end),
            matching: DateComponents(hour: 0, minute: 0, second: 0)
        )
    }
    
    private func isSameDay(date1: Date, date2: Date) -> Bool{
        let calendar = Calendar.current
        return calendar.isDate(date1, inSameDayAs: date2)
    }
    
    private func extractDate() -> [DateValue]{
        
        let calendar = Calendar(identifier: .iso8601)
        
        let currentMonth = getCurrentMonth()
        
        
        let days = days(for: currentMonth).compactMap { date -> DateValue in
            let day = calendar.component(.day, from: date)
            return DateValue(day: day, date: date)
        }
        
        return days
    }
    
    @ViewBuilder
    func CardView(val: DateValue) -> some View {
        VStack {
            if calendar.isDate(val.date, equalTo: currentDate, toGranularity: .month) {
                Divider()
                    .padding(.horizontal ,-4)
                Text("\(val.day)")
                    .font(.title3)
                    .frame(width: 35, height: 35)
                    .background {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color("CPink"))
                            .opacity(isSameDay(date1: val.date, date2: currentDate) ? 1 : 0)
                            .padding(.top, 5)
                            .frame(width: 30, height: 45)
                    }
                    .onTapGesture {
                        currentDate = val.date
                    }
            } else {
                Text("\(val.day)")
                    .font(.title3)
                    .frame(width: 35, height: 35)
                    .foregroundColor(.gray)
            }
            
        }
    }
}

fileprivate extension Calendar {
    
    func generateDates(
        inside interval: DateInterval,
        matching components: DateComponents
    ) -> [Date] {
        var dates: [Date] = []
        dates.append(interval.start)
        
        enumerateDates(
            startingAfter: interval.start,
            matching: components,
            matchingPolicy: .nextTime
        ) { date, _, stop in
            if let date = date {
                if date < interval.end {
                    dates.append(date)
                } else {
                    stop = true
                }
            }
        }

        return dates
    }
}

struct CalendarUserSetting_Previews: PreviewProvider {
    static var previews: some View {
        CalendarUserSetting()
    }
}
