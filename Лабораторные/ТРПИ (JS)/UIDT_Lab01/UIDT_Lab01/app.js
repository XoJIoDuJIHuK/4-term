"use strict";
exports.__esModule = true;
exports.Task2 = void 0;
//task 1
function TelNumberFormat(array) {
    for (var i = 0; i < array.length; i++) {
        if (!Number.isInteger(array[i])) {
            return ("Numbers can't ne float");
        }
        if (array[i] < 0 || array[i] > 9) {
            return ("Only digits allowed");
        }
    }
    if (array.length != 10) {
        return ("invalid array length");
    }
    var ret = "(***) ***-****";
    for (var i = 0; i < array.length; i++) {
        ret = ret.replace('*', array[i].toString());
    }
    return ret;
}
console.log(TelNumberFormat([5, 3, 7, 4, 7, 3, 5, 8, 9, 1]));
//task2
var Task2 = /** @class */ (function () {
    function Task2() {
    }
    Task2.MethodTask2 = function (num) {
        if (num < 0)
            return 0;
        var a = 0;
        var sum = 0;
        while (a < num) {
            sum += a;
            a += 3;
        }
        a = 0;
        while (a < num) {
            if (a % 3 != 0)
                sum += a;
            a += 5;
        }
        return sum;
    };
    return Task2;
}());
exports.Task2 = Task2;
console.log(Task2.MethodTask2(15));
//task3
var task3array = [1, 2, 3, 4, 5, 6, 7];
function TurnArrayRight(k) {
    if (k < 0) {
        console.log("k can't be negative");
        return;
    }
    for (var i = 0; i < k; i++) {
        task3array.unshift(task3array.pop());
    }
    console.log(task3array);
}
TurnArrayRight(3);
//task4
function Median(array1, array2) {
    var task4set = new Set();
    for (var i = 0; i < array1.length; i++) {
        task4set.add(array1[i]);
    }
    for (var i = 0; i < array2.length; i++) {
        task4set.add(array2[i]);
    }
    var sum = 0;
    task4set.forEach(function (value) {
        sum += value;
    });
    console.log(sum / task4set.size);
}
Median([1, 2, 3], [3, 4, 5, 6]);
//task5
function SudokuCheck(array) {
    var nine = 9;
    for (var i = 0; i < nine; i++) //lines
     {
        var set = new Set();
        for (var j = 0; j < nine; j++) {
            if (array[i][j] == 0)
                continue;
            if (set.has(array[i][j])) {
                console.log("Lines: board is incorrect in [".concat(i, ";").concat(j, "]"));
                return;
            }
            else
                set.add(array[i][j]);
        }
    }
    for (var i = 0; i < nine; i++) //columns
     {
        var set = new Set();
        for (var j = 0; j < nine; j++) {
            if (array[j][i] == 0)
                continue;
            if (set.has(array[j][i])) {
                console.log("Columns: board is incorrect in [".concat(j, ";").concat(i, "] = ").concat(array[j][i]));
                return;
            }
            else
                set.add(array[j][i]);
        }
    }
    var bounds = [[0, 3], [3, 6], [6, 9]];
    for (var i = 0; i < 3; i++) {
        for (var j = 0; j < 3; j++) {
            var setForSquare = new Set();
            for (var m = bounds[i][0]; m < bounds[i][1]; m++) {
                for (var n = bounds[j][0]; n < bounds[j][1]; n++) {
                    if (array[m][n] == 0)
                        continue;
                    if (setForSquare.has(array[m][n])) {
                        console.log("Squares: board is incorrect in [".concat(m, ";").concat(n, "]"));
                        return;
                    }
                    else
                        setForSquare.add(array[m][n]);
                }
            }
        }
    }
    console.log("Table is correct");
}
var arrayTask5 = [
    [5, 3, 0, 0, 7, 0, 0, 0, 0],
    [6, 0, 0, 1, 9, 5, 0, 0, 0],
    [0, 9, 8, 0, 0, 0, 0, 6, 0],
    [8, 0, 0, 0, 6, 0, 0, 0, 3],
    [4, 0, 0, 8, 0, 3, 0, 0, 1],
    [7, 0, 0, 0, 2, 0, 0, 0, 6],
    [0, 6, 0, 0, 0, 0, 2, 8, 0],
    [0, 0, 0, 4, 1, 9, 0, 0, 5],
    [0, 0, 0, 0, 8, 0, 0, 7, 9]
];
SudokuCheck(arrayTask5);
