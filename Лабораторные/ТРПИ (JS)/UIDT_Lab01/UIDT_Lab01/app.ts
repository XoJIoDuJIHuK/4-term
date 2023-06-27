//task 1
function TelNumberFormat(array : number[]) : string
{
    for (let i : number = 0; i < array.length; i++)
    {
        if (!Number.isInteger(array[i]))
        {
            return ("Numbers can't ne float");
        }
        if (array[i] < 0 || array[i] > 9)
        {
            return ("Only digits allowed");
        }
    }
    if (array.length != 10)
    {
        return ("invalid array length");
    }
    let ret = "(***) ***-****";
    for (let i = 0; i < array.length; i++) 
    {
        ret = ret.replace('*', array[i].toString());
    }
    return ret;
}
console.log(TelNumberFormat([5,3,7,4,7,3,5,8,9,1]));

//task2
export class Task2
{
    static MethodTask2(num : number) : number
    {
        if (num < 0) return 0;
        let a : number = 0;
        let sum : number = 0;
        while (a < num)
        {
            sum += a;
            a += 3;
        }
        a = 0;
        while (a < num)
        {
            if (a % 3 != 0) sum += a;
            a += 5;
        }
        return sum;
    }
}
console.log(Task2.MethodTask2(15));

//task3
let task3array : number[] = [1, 2, 3, 4, 5, 6, 7];
function TurnArrayRight(k : number)
{
    if (k < 0)
    {
        console.log("k can't be negative");
        return;
    }
    for (let i : number = 0; i < k; i++)
    {
        task3array.unshift(task3array.pop());
    }
    console.log(task3array);
}
TurnArrayRight(3);

//task4
function Median(array1 : number[], array2 : number[])
{
    let task4set = new Set<number>();
    for (let i : number = 0; i < array1.length; i++)
    {
        task4set.add(array1[i]);
    }
    for (let i : number = 0; i < array2.length; i++)
    {
        task4set.add(array2[i]);
    }
    let sum : number = 0;
    task4set.forEach(function(value) {
        sum += value;
    });
    console.log(sum / task4set.size);
}
Median([1, 2, 3], [3, 4, 5, 6]);

//task5
function SudokuCheck(array : number[][])
{
    const nine : number = 9;
    for (let i : number = 0; i < nine; i++) //lines
    {
        let set = new Set<number>();
        for (let j : number = 0; j < nine; j++)
        {
            if (array[i][j] == 0) continue;
            if (set.has(array[i][j]))
            {
                console.log(`Lines: board is incorrect in [${i};${j}]`);
                return;
            }
            else set.add(array[i][j]);
        }
    }
    for (let i : number = 0; i < nine; i++) //columns
    {
        let set = new Set<number>();
        for (let j : number = 0; j < nine; j++)
        {
            if (array[j][i] == 0) continue;
            if (set.has(array[j][i]))
            {
                console.log(`Columns: board is incorrect in [${j};${i}] = ${array[j][i]}`);
                return;
            }
            else set.add(array[j][i]);
        }
    }
    let bounds : number[][] = [[0, 3], [3, 6], [6, 9]];
    for (let i : number = 0; i < 3; i++)
    {
        for (let j : number = 0; j < 3; j++)
        {
            let setForSquare = new Set<number>();
            for (let m : number = bounds[i][0]; m < bounds[i][1]; m++)
            {
                for (let n : number = bounds[j][0]; n < bounds[j][1]; n++)
                {
                    if (array[m][n] == 0) continue;
                    if (setForSquare.has(array[m][n]))
                    {
                        console.log(`Squares: board is incorrect in [${m};${n}]`);
                        return;
                    }
                    else setForSquare.add(array[m][n]);
                }
            }
        }
    }
    console.log("Table is correct");
}
let arrayTask5 : number[][] = [
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
SudokuCheck(arrayTask5)