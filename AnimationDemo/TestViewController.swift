//
//  TestViewController.swift
//  AnimationDemo
//
//  Created by Manas Mishra on 08/08/17.
//  Copyright © 2017 Manas Mishra. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    let test = Test2()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(_ animated: Bool) {
        let gArray = [8,4,5,2,10]
        let k = 2
        //let differe = decidingMaximumWeightDifference(gArray, k: k)
    }
    
    @IBAction func starttest(_ sender: Any) {
        test.startTest()
        
//        let count = quickSort(start: 0, end: arr.count - 1)
//        print(count)
       // binaryGap(8)
       // numberOfDisc([5, 6, 4, 3, 6, 2, 3], [2, 3, 5, 2, 4])
        //countBrackets(&ssrt)
        //winner("23A84Q", "K2Q25J")
        //largestSentence("Forget  CVs..Save time . x x")
        //mainthread()
//        var i: String?
//
//        var j = i?.characters.count == 0
//
//        let gArray = [8,4,5,2,10]
//        let k = 2
//        let differe = decidingMaximumWeightDifference(gArray, k: k)
        
    }
    
    //Q: Largest area under histogram
    func findTheLargestArea(arr: [Int]) -> Int {
        var largestArea = 0
        var histStack = Stack()
        for i in 0...arr.count {
            if let top = histStack.top {
                if arr[i] >= top {
                    histStack.push(i)
                } else if arr[i] < top {
                    while !histStack.isEmpty {
                        if histStack.top! >= arr[i] {
                            //Calculate the area
                            
                            histStack.pop()
                        } else {
                            break
                        }
                    }
                    
                }
            } else {
                histStack.push(i)
            }
        }
    }
    
    //Q: Quick Sort
    func quickSort(start: Int, end: Int) {
        if start < end {
            let pivot = partition(start: start, end: end)
            quickSort(start: start, end: pivot - 1)
            quickSort(start: pivot + 1, end: end)
        }

    }

    func partition(start: Int, end: Int) -> Int {
        let pivot = arr[end]
        var separationIndex = start
        for i in start..<end {
            if arr[i] < pivot {
                let temp = arr[i]
                arr[i] = arr[separationIndex]
                arr[separationIndex] = temp
                separationIndex += 1
            }
        }
        arr[end] = arr[separationIndex]
        arr[separationIndex] = pivot
        return separationIndex
    }
    
    
    //Q: Merge sort
    //var arr: [Int] = [ 4, 2, 1, 25, 30, 3]
    var arr: [Int] = [ 9, 7, 3, 2, 4, 8, 6]
    func mergeSort(start: Int, end: Int) {
        guard start < end else {return}
        let mid = (start + end) / 2
        mergeSort(start: start, end: mid)
        mergeSort(start: mid + 1, end: end)
        mergeTwoArrays(start: start, mid: mid, end: end)
    }
    func mergeTwoArrays(start: Int, mid: Int, end: Int) {
        var newArr = [Int]()
        var j = mid + 1
        var i = start
        while (i <= mid) {
            if j > end {
                newArr.append(arr[i])
                i += 1
                continue
            }
            if arr[i] <= arr[j] {
                newArr.append(arr[i])
                i += 1
            } else {
                newArr.append(arr[j])
                j += 1
            }
        }
        while j <= end {
            newArr.append(arr[j])
            j += 1
        }
        for k in start...end {
            arr[k] = newArr[k - start]
        }
    }
    
    
    //Q: Algorithm to find the contiguous sub-array with maximum sum, for a given array of positive and negative numbers.
    func maximumPositiveSumFrom(arr: [Int]) -> Int {
        var maxSumOfSubArr = 0
        var maxSumTillNow = 0
        for each in arr {
            maxSumTillNow += each
            if maxSumTillNow < 0 {
                maxSumTillNow = 0
            }
            if maxSumOfSubArr < maxSumTillNow {
                maxSumOfSubArr = maxSumTillNow
            }
        }
        return maxSumOfSubArr
    }
    
    //Q: algorithm to find the smallest integer value that can't be represented as sum of any subset of a given sorted array
    func getSmallestIntWhichCanNotBeFormedFromSumOfSubSetsOf(arr: [Int]) -> Int {
        var smallestInt = 1
        for each in arr {
            if each <= smallestInt {
                smallestInt += each
            } else {
                break
            }
        }
        return smallestInt
    }
    
    func segregate0And1(arr:[Int]) -> [Int] {
        var newArr = arr
        var zeroPointerIndex = 0
        var onePointerIndex = arr.count - 1
        while zeroPointerIndex < onePointerIndex {
            if (newArr[zeroPointerIndex] == 0) && (newArr[onePointerIndex] == 1) {
                zeroPointerIndex += 1
                onePointerIndex -= 1
            } else if (newArr[zeroPointerIndex] == 1) && (newArr[onePointerIndex] == 0) {
                let temp = newArr[zeroPointerIndex]
                newArr[zeroPointerIndex] = newArr[onePointerIndex]
                newArr[onePointerIndex] = temp
                zeroPointerIndex += 1
                onePointerIndex -= 1
            } else if newArr[zeroPointerIndex] == 1 {
                onePointerIndex -= 1
            } else if newArr[onePointerIndex] == 0 {
                zeroPointerIndex -= 0
            }
        }
        return newArr
    }
    
    
    func reverseTheArr(arr: [Int]) -> [Int] {
        var newArr = arr
        var i = 0
        while(i < (newArr.count - 1 - i)) {
            let temp = newArr[i]
            newArr[i] = newArr[newArr.count - 1 - i]
            newArr[newArr.count - 1 - i] = temp
            i += 1
        }
        return newArr
    }
    
    func numberOccuringOddTimes(arr: [Int]) -> Int {
        var xorOfArray = 0
        for each in arr {
            xorOfArray = xorOfArray ^ each
        }
        return xorOfArray
    }
    
    
    func majorityElementFromAnArray(arr: [Int]) -> Int {
        var majorElement = arr.first ?? 0
        var majorElementCount = 1
        for i in 1..<arr.count {
            let each = arr[i]
            if each == majorElement {
                majorElementCount += 1
               continue
            } else {
                majorElementCount -= 1
                if majorElementCount == 0 {
                    majorElementCount = 1
                    majorElement = each
                }
            }
        }
        return majorElementCount
    }
    
    func findCountOfLinkedListFrom(arr: [Int]) -> Int {
        var lengthOfList = 0
        var nextNodeIndex = 0
        while(lengthOfList < arr.count) {
            lengthOfList += 1
            if arr[nextNodeIndex] == -1 {
                break
            }
            nextNodeIndex = arr[nextNodeIndex]
        }
        return lengthOfList
    }
    

    func numInClininc(_ B: Int, _ N: Int, _ A: [Int]) -> Int {
        let excessClinic = B - N
        var totalPeople = 0
        for each in A {
            totalPeople = totalPeople + each
        }
        var peoplePerClinic = totalPeople / excessClinic
        var clinics:[Int] = []
        var clinicsTotal = 0
        var i = 0
        for each in A{
            clinicsTotal = each / peoplePerClinic + clinicsTotal
            var newClinic = each / peoplePerClinic
            if i == A.count - 1{
                newClinic = N - B - clinicsTotal + newClinic
            }
            clinics.append(newClinic)
            
            i = i+1
        }
        return A.first! / clinics.first!
    }
    
    
    
    
    
    
    
    
    
    
    
    
    func indexCounting(_ A: inout [Int]) -> Int {
        let i = 0
        var leftSum = 0
        var rightSum = 0
        for each in A{
            rightSum = rightSum + each
        }
        if A.count == 0{
            return 0
        }
        if rightSum == 0{
            return A.count-1
        }
        for each in A{
            if i != 0{
                leftSum = leftSum + A[i-1]
                if i == 0{
                    rightSum = rightSum - leftSum - A[1]
                }else{
                    rightSum = rightSum - A[i]
                }
                if leftSum == rightSum{
                    return i
                    break
                }
            }
            
        }
        return -1
    }
    func binaryGap(_ n: Int) -> Int{
        let binaryString:[Int] = findBinary(n)
        var next1Position: Int?
        var maxBinaryGap = 0
        var i = 0
        for each in binaryString{
            
            if each == 1{
                if next1Position != nil{
                    if i - next1Position! > maxBinaryGap{
                         maxBinaryGap = i - next1Position!
                    }
                   
                }
               next1Position = i
            }
            i = i + 1
        }
        
        return maxBinaryGap
    }
    func findBinary(_ n: Int) -> [Int]{
        var dividend = n
        var binaryString:[Int] = []
        while dividend > 1{
        if dividend % 2 == 0{
            binaryString.insert(0, at: 0)
        }else{
            binaryString.insert(1, at: 0)
            }
        dividend = dividend / 2
        }
        binaryString.insert(dividend, at: 0)
        print(binaryString)
        return binaryString
    }
    func numberOfDisc(_ a :  [Int], _ b :  [Int]) -> Int {
        var discCountIndex = 0
        var wellRingIndex = a.count - 1
        let sorted = a.enumerated().sorted(by: {$0.element < $1.element})
        let arrayIndices = sorted.map{$0.offset}
        var sortedArrayIndex = 0
        
        for eachDisc in b{
            for each in sortedArrayIndex...arrayIndices.count-1{
                if eachDisc <= a[each] {
                    discCountIndex = discCountIndex + 1
                    wellRingIndex = wellRingIndex - each
                    sortedArrayIndex = each + 1
                    break
                }
            }
            if wellRingIndex == 0{
                break
            }
        }
        print(discCountIndex)
        return discCountIndex
        
    }
//    func numberOfIntersection(_ r: [Int]) -> Int {
//        var intersectionCount = 0
//        var centerIndex = 0
//        for each in r{
//           let rightIndex = centerIndex + each
//            if rightIndex < r.count{
//                intersectionCount = intersectionCount + rightIndex - centerIndex
//            }
//            else
//            {
//                intersectionCount = intersectionCount + r.count - centerIndex
//            }
//            
//            
//         centerIndex = centerIndex + 1
//        }
//    }
    
    func countBrackets(_ S : inout String) -> Int {
        let bracketArray = S.characters
        var openingBracketCount = 0
        for each in bracketArray{
            if each == "("{
                openingBracketCount = openingBracketCount + 1
            }
        }
        if openingBracketCount == 0{
            return bracketArray.count
        }
        if openingBracketCount == bracketArray.count{
            return 0
        }
        var openingBracketCountFromInitial = 0
        var i = 0
        for eachBracket in bracketArray{
            if eachBracket == "(" {
                openingBracketCountFromInitial = openingBracketCountFromInitial + 1
            }
            if bracketArray.count - 1 - i - (openingBracketCount - openingBracketCountFromInitial) == openingBracketCountFromInitial{
                break
            }
            i = i + 1
        }
        print(i + 1)
        return i + 1
    }
    
    func winner(_ A: String, _ B: String) -> Int {
        let a = A.characters
        let b = B.characters
        if a.count != b.count{
            return -1
        }
        if a.count == 0{
            return 0
        }
        var alecWinner = 0
        var i = 0
        for each in a{
            let newEachA = convertToNumber(String(each))
            let newEachB = convertToNumber(String(B[B.index(B.startIndex, offsetBy: i)]))
            if newEachA > newEachB{
                alecWinner = alecWinner + 1
            }
            i = i + 1
        }
        print(alecWinner)
        return alecWinner
        
    }
    
    func convertToNumber(_ a: String) -> Int{
        switch a {
        case "A":
            return 14
        case "K":
            return 13
        case "Q":
            return 12
        case "J":
            return 11
        case "T":
            return 10
        default:
            return Int(a)!
        }
    }
    
    func largestSentence(_ S: String) -> Int {
        let s = S.characters
        var arrayOfSentences = [(Int, Int)]()
        var i = 0
        var startingI = 0
        for each in s{
            if each == "." || each == "?" || each == "!" || i == s.count - 1{
                if i > 0{
                    if startingI + 1 < i{
                    let sentence = (startingI + 1, i)
                    arrayOfSentences.append(sentence)
                    startingI = i + 1
                }
                }
            }
            i = i + 1
        }
        var maximumWords = 0
        for each in arrayOfSentences{
            let noOfWords = countWords(S, index: each)
            if noOfWords > maximumWords{
                maximumWords = noOfWords
            }
        }
        print(maximumWords)
        return maximumWords
    }
    
    func countWords(_ S : String, index: (Int, Int)) -> Int {
        let s = Array(S.characters)
        var wordCount = 0
        for i in index.0...index.1{
            if i != index.0 || i != index.1{
                if s[i] == " "{
                    wordCount = wordCount + 1
            }
        }
        
    }
        return wordCount + 1
    
    }
    
    //Checking main thread async 
    func mainthread() {
        
        DispatchQueue.main.async {
            var i = 0
            for _ in 0...1000000000{
                i = i + 1
            }
            print(i)
        }
        DispatchQueue.main.async {
            print("again")
        }
    }
    
    //MARK:- Getting the price of the kth item
    func getThePrice(itemBrand: [Int], itemPrice: [Int], brandsOfTheShopperChoice: [Int], kthCheapestElent: Int) -> Int {
        var chepestElementCount = 0
        var j = 0
        for i in 0..<itemBrand.count{
            if itemBrand[i] == brandsOfTheShopperChoice[j]{
                
            }
        }
        
        return -1
        
    }
    
    func decidingMaximumWeightDifference(_ weightArray: [Int], k: Int) -> Int {
        let sumOfArray = weightArray.reduce(0, +)
        if k >= weightArray.count || k == 0 {
            return sumOfArray
        }
        let key = k > (weightArray.count / 2) ? weightArray.count - k : k
        let sortedWeightArray = weightArray.sorted(by: { $0 < $1 })
        let sumOfKthArray = gettingSumOfArrayTillKThElement(index: key - 1, array: sortedWeightArray)
        let supermanPart = sumOfArray - sumOfKthArray
        let difference = supermanPart - sumOfKthArray
        return difference
    }
    
    func gettingSumOfArrayTillKThElement(index: Int, array: [Int]) -> Int {
        var sum = 0
        var i = 0
        for each in array {
            sum += each
            i += 1
            if i > index { break }
        }
        return sum
    }
    
    
  
}

struct Stack {
    private var stack = [Int]()
    
    mutating func push(_ element: Int) {
        stack.insert(element, at: 0)
    }
    mutating func pop() {
        if !isEmpty {
            stack.remove(at: 0)
        }
    }
    
    var top: Int? {
        if !isEmpty {
            let element = stack[0]
            return element
        }
        return nil
    }
    var isEmpty: Bool {
        if stack.count > 0 {
            return false
        }
        return true
    }
}


































