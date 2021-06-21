//
//  ChartUtility.swift
//  Covid19App
//
//  Created by Vibhash Kumar on 19/06/21.
//

import Foundation

import UIKit
import Charts


class ChartUtility{
    
    
    
    //MARK: Set Up Line Chart
    func SetUpLineChart(_ chartView:LineChartView, covid19Casees: Array<ConfirmedCovidCaseData>)->LineChartView{
        
        // ececec
        var activeCase : Array<Double> = []
        var recovered : Array<Double> = []
        var death : Array<Double> = []
        
        
        for item in covid19Casees {
            activeCase.append(Double(item.Active))
            recovered.append(Double(item.Recovered))
            death.append(Double(item.Deaths))
        }
        
         
      
        var activeCaseEntry : [ChartDataEntry] = [ChartDataEntry]()
        var recoveredEntry: [ChartDataEntry] = [ChartDataEntry]()
        var deathEntry : [ChartDataEntry] = [ChartDataEntry]()
        
        for i in 0..<activeCase.count{
           
            activeCaseEntry.append(ChartDataEntry(x: Double(i+1), y: activeCase[i]))
        }
        
        
       
        
        let valueformatter = NumberFormatter()
        valueformatter.numberStyle = .decimal
        valueformatter.locale = Locale.current
        
        let set1: LineChartDataSet = LineChartDataSet(entries: activeCaseEntry, label: "Active Cases")
        set1.drawFilledEnabled = false
        set1.axisDependency = .left // Line will correlate with left axis values
        set1.setColor(.blue)
        set1.mode = .cubicBezier
        set1.setCircleColor(UIColor.blue)
        set1.lineWidth = 2.0
        set1.circleRadius = 1.0
        set1.fillAlpha = 65 / 255.0
        set1.fillColor = UIColor.blue
        set1.highlightColor = UIColor.blue
        set1.drawCircleHoleEnabled = true
        set1.valueTextColor = .blue
        set1.valueFormatter = DefaultValueFormatter(decimals: 0)
       
        
        for i in 0..<recovered.count{
           
           
            recoveredEntry.append(ChartDataEntry(x: Double(i+1), y: recovered[i]))
            
        }
        
        let set2: LineChartDataSet = LineChartDataSet(entries: recoveredEntry, label: "Recovered")
        set2.axisDependency = .left // Line will correlate with left axis values
        set2.drawFilledEnabled = false
        set2.setColor(.systemGreen)
        set2.setCircleColor(UIColor.systemGreen)
        set2.lineWidth = 2.0
        set2.circleRadius = 1.0
        set2.fillAlpha = 65 / 255.0
        set2.fillColor = UIColor.systemGreen
        set2.highlightColor = UIColor.systemGreen
        set2.drawCircleHoleEnabled = false
        set2.mode = .cubicBezier
        set2.valueTextColor = .systemGreen
        set2.valueFormatter = DefaultValueFormatter(decimals: 0)
        
        
        for i in 0..<death.count{
           
           
            deathEntry.append(ChartDataEntry(x: Double(i+1), y: death[i]))
            
        }
        
        let set3: LineChartDataSet = LineChartDataSet(entries: deathEntry , label: "Death")
        set2.axisDependency = .left // Line will correlate with left axis values
        set3.drawFilledEnabled = false
        set3.setColor(.red)
        set3.setCircleColor(UIColor.red)
        set3.lineWidth = 2.0
        set3.circleRadius = 1.0
        set3.fillAlpha = 65 / 255.0
        set3.fillColor = UIColor.red
        set3.highlightColor = UIColor.red
        set3.drawCircleHoleEnabled = false
        set3.mode = .cubicBezier
        set3.valueTextColor = .red
        set3.valueFormatter = DefaultValueFormatter(decimals: 0)
        
        
       
        
        chartView.chartDescription?.enabled = false
        chartView.dragEnabled = false
        chartView.setScaleEnabled(false)
        chartView.pinchZoomEnabled = false
        chartView.rightAxis.enabled = false
    
        
        let l = chartView.legend
        l.form = .square
        l.font = UIFont(name: "HelveticaNeue-Light", size: 11)!
        l.textColor = .black
        l.horizontalAlignment = .left
        l.verticalAlignment = .bottom
        l.orientation = .horizontal
        l.drawInside = false
        
        let xAxis = chartView.xAxis
        xAxis.labelFont = .systemFont(ofSize: 11)
        xAxis.labelTextColor = .black
        
        xAxis.drawAxisLineEnabled = true
        xAxis.axisLineColor = UIColor.blue
        xAxis.labelPosition = XAxis.LabelPosition.bottom
        xAxis.axisLineWidth = 1.0
        xAxis.axisMinimum = 0
        xAxis.axisMaximum = Double((covid19Casees.count)+1)
        
        xAxis.granularity = 1
        xAxis.drawGridLinesEnabled = true
        xAxis.gridColor = .lightGray
            //Utils().hexStringToUIColor(hex: "#cccccc")
        xAxis.axisLineDashPhase = 1
        xAxis.drawLabelsEnabled = true
        
        let yAxis = chartView.leftAxis
       
        yAxis.labelFont = .systemFont(ofSize: 11)
       // yAxis.labelTextColor = .lightText
        yAxis.labelTextColor = UIColor.darkGray
        yAxis.drawAxisLineEnabled = true
        yAxis.granularity = 1
        
        let targetLine = ChartLimitLine(limit: Double(0) , label: "Date")
        targetLine.lineWidth = 1
        targetLine.lineColor = .darkGray
        targetLine.valueFont = UIFont.systemFont(ofSize: 10)
       // targetLine.lineDashLengths = [8.0]
        yAxis.addLimitLine(targetLine)
        yAxis.axisLineColor = UIColor.gray
       
        
        
        yAxis.axisLineWidth = 1.0
        yAxis.drawGridLinesEnabled = true
      
       // chartView.animate(yAxisDuration: 5)
        chartView.animate(xAxisDuration: 5)
        
        
      
       
        let data = LineChartData(dataSets: [set1,set2,set3])
       
        //data.setValueTextColor(.clear)
        data.setValueFont(.systemFont(ofSize: 9))
       
        chartView.data = data
        
        
        
        return chartView
    }
    
    
    

}


