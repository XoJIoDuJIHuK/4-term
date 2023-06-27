//Task 1

class Person
{
    id : number
    name : string
    group : number
}

const array : Person[] = [
    {id: 1, name: 'Vasya', group: 10}, 
    {id: 2, name: 'Ivan', group: 11},
    {id: 3, name: 'Masha', group: 12},
    {id: 4, name: 'Petya', group: 10},
    {id: 5, name: 'Kira', group: 11},
    {id: 6, name: 'Kirill', group: 9},
];

//Task 2, 3

type CarsType = { manufacturer? : string, model? : string };
type ArrayCarsType = { cars : CarsType[] };

let car: CarsType = {}; //объект создан!
car.manufacturer = "manufacturer";
car.model = 'model';

const car1: CarsType = {}; //объект создан!
car1.manufacturer = "manufacturer";
car1.model = 'model';

const car2: CarsType = {}; //объект создан!
car2.manufacturer = "manufacturer";
car2.model = 'model';

const arrayCars: Array<ArrayCarsType> = [{
    cars: [car1, car2]
}];

//Task 4

type MarkFilterType = 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10;
type DoneType = true | false;
type GroupFilterType = 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12;

type MarkType = {
    subject: string,
    mark: MarkFilterType, // может принимать значения от 1 до 10
    done: DoneType,
}
type StudentType = {
    id: number,
    name: string,
    group: GroupFilterType, // может принимать значения от 1 до 12
    marks: Array<MarkType>
}

class GroupType {
    students: StudentType[];// массив студентов типа StudentType
    studentsFilter(group: GroupFilterType) : Array<StudentType> {
        let ret : Array<StudentType> = [];
        for (let s of this.students)
        {
            if (s.group == group)
            {
                ret.push(s);
            }
        }
        return ret;
    }; // фильтр по группе
    marksFilter(mark: number) : Array<StudentType> {
        let ret : Array<StudentType> = [];
        for (let s of this.students)
        {
            for (let m of s.marks)
            {
                if (m.mark == mark)
                {
                    ret.push(s);
                    break;
                }
            }
        }
        return ret;
    }; // фильтр по  оценке
    deleteStudent(id: number) : void {
        if (this.students[id])
        {
            this.students.splice(id, 1);
        }
        else console.log("such element is undefined");
    }; // удалить студента по id из  исходного массива
    mark: MarkFilterType;
    group: GroupFilterType;
    constructor() {
        this.students = GenerateStudents();
        this.mark = markVariants[Math.round(Math.random() * 9)];
        this.group = groupVariants[Math.round(Math.random() * 11)];
    }
    print() : void {
        for (let s of this.students)
        {
            let str : String = `id: ${s.id}, name: ${s.name}, group:${s.group}, marks:[`;
            for (let m of s.marks)
            {
                str += `${m.subject} ${m.mark} ${m.done} `;
            }
            str += "]";
            console.log(str);
        }
    }
}

let markVariants : MarkFilterType[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
let groupVariants : GroupFilterType[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];

function GenerateStudents() : StudentType[]
{
	function GenerateStudent(id : number) : StudentType
	{
		let subjects : string[] = ["Math", "Science", "Biology", "OAIP"];
		let names : string[] = ["Alexei", "Vladimir", "Petr", "Ivan"];
		let marks : Array<MarkType> = [];
		let amount : number = Math.round(Math.random() * 4 + 1);
		for (let i = 0; i < amount; i++)
		{
			marks.push({subject: subjects[Math.round(Math.random() * (subjects.length - 1))], 
                mark: markVariants[Math.round(Math.random() * 9)], 
                done: true});
		}
        return {
            id: id, marks: marks,
            group: groupVariants[Math.round(Math.random() * (groupVariants.length - 1))],
            name: names[Math.round(Math.random() *
                (names.length - 1))]
        };
	}
	let ret : StudentType[] = [];
	let amount : number = Math.round(Math.random() * 3 + 10);

	for (let i = 0; i < amount; i++)
	{
		ret.push(GenerateStudent(i))
	}

	return ret;
}

let group : GroupType = new GroupType();
group.print();
group.deleteStudent(0);
console.log("deleted student 0");
group.print();
console.log("marks filter");
for (let s of group.marksFilter(4))
{
    console.log(s.name + " " + s.id);
}
console.log("group filter");
for (let s of group.studentsFilter(2))
{
    console.log(s.name + " " + s.id);
}