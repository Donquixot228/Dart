import 'dart:io';

//ПЕРЕМЕННЫЕ,КОММЕНТЫ И ОБЛАСТЬ ВИДИМОСТИ

/* num: int,double
  String

*/
///что-то [print]
void Variables() {

   var secondNumber = 1.5;
   print("$secondNumber == ${secondNumber.runtimeType}");


   var booln = true;
   print("$booln == ${booln.runtimeType}\n");
   //чувствителен к регистру   var secondeNumber=1;


  //использовать когда не знам какой тип будет поступать, лучше не использовать без необходимости
   dynamic Variable = 11;

   print(Variable);
   Variable = 10.5;
   print(Variable);
   Variable = true;
   print(Variable);
   Variable = 'string';
   print(Variable);
   print('\n');

   //const
final asdf = 0xFFFF0000.abs();


 //преобразование типов
   var intNum=1;

   double doubleNum = intNum.toDouble();
   print(doubleNum);

   int intNum2= doubleNum.round();
   print(intNum2);

   var str= intNum.toString();   //toStringAsFixed- если нужно n после точки (double)
   print('$str = ${str.runtimeType}');

   var intNum3= double.parse(str);
   print(intNum3);

print('\n');



  //арифметические операции
  var x = 50;
  var y = 6;
  print("x~/y== ${x ~/ y}");
  print("x++ == ${x++}");
  print("++x == ${++x}");

  //  operatori ?. ?? = as is is! установлено ли значение

print('\n');

  var numbers=1;
  print((numbers as int).isEven);
  print(numbers is double);
  print(numbers is! double);
  if (numbers is int) {
    print(numbers.isEven);
  }

//class DataTime
print('\n');

  var dateTime1 = DateTime.parse('2021-09-01 23:22:00');
  var dateTime2 = DateTime(2021, 09, 01, 23, 22, 05);
  var dateTime3=DateTime.now();

  print(dateTime1);
  print(dateTime1.hour);
  print(dateTime1.isAfter(dateTime2));
  print(dateTime1.difference(dateTime2));
  print(dateTime1.compareTo(dateTime2));
  print(dateTime2.compareTo(dateTime1.add(Duration(seconds: 5))));
  print(dateTime3);
}

/********************************************************************/


void Collection() {
  var numbers =  <int>[1, 2, 3];
  //List<int> numbers = [1, 2, 3];
  //numbers[0], const                       //spred operator
  var numbers1 = [1, if (numbers.length > 2) ...numbers, 22];
  var numbers2 = [for (var i in numbers1) i * i];
//.clear,add,addAll.....

  //set<int> .. ={};lj,добавляет только те которых нет
  Set<int> numbers3 = {...numbers, 2, 4, 1};
  //Map ключи
  var phoneBook = <String, String>{
    'num1': 'phoneNumber1',
    'num2': 'phoneNumber2',
    'num3': 'phonenumb3'
  };

  print(numbers);
  print(numbers1);
  print(numbers2);
  print(numbers3);
  print(phoneBook);
  print(phoneBook['num3']);
}

/********************************************************************/

void if_Cycle() {

var numb=int.parse(stdin.readLineSync()!);
//  ! ><= != && ||
if(numb.isEven ){
  print('$numb is Even\n');
}else print('$numb is Odd\n');


//numb.is

  var mass = <int>[1, 2, 3, 4, 5];

  for (var element in mass) {
    var sqr = element * element;
    print('$element^2==$sqr');
    switch (sqr) {
      case 9:
        print("kotik");
        break;
    }
  }
print('\n');

  mass.forEach((element) {
    element = element * element;
    print(element);
  });
print('\n');

for (int i = 0; i < mass.length; i++) {
    var sqr = mass[i] * mass[i];
    print(sqr);
  }

  print(mass);

int i=0;
while(i<3){
  print('Hello avada');
  i++;
}

do{
  print('Kotik');
}while(i==10);


}

/*******************************************************************/


void Func() {
  //void func(String name,String surname)  =>  print("$name  $surname");
   //val ad=func();
   var age = int.parse(stdin.readLineSync()!);
   print(age);

   int sumd(int a, int b) {
     return a + b;
    }

    int age1 = sumd(age,2);
    print(age1);

   // именованные
   String hello_friend({String? name,String? surname}){
     return 'Привет $name $surname';
   }
   print(hello_friend(name: 'kirill',surname: 'Noskov'));

   //не обязатель
   String user(String nam,int age,[String? job]){
     var result= '$nam возраст: $age ';
     if(job !=null){
      return ('${result + job}');
     }else return result;
   }
     print(user('kirill',20,'Student'));
     print(user('kirill',20));

  //по умолчанию
     String user2({String name='Kirill',String surname='Noskov'}){
       return '$name $surname';
  }
     print(user2());
     print(user2(surname: 'aaa'));

 // замыканиz-closers  - функции могут замыкать переменые в себя

   Function addFunction (num add){
          return (num i) => add+i;
   }
     var add2=addFunction(2);
     var add3=addFunction(3);
     print(add2(2));
     print(add3(4));


 }




/***************************_Инициализация классов и объектов_***************************************/

 class Users{

    String? name;
    String? surname;
    num? age;
    num? date;
    String? job;


    //конструктор
      Users(String name,String surname)
     {
        this.name=name;
        this.surname=surname;

     }
    // Users({this.name,this.surname});

    //именованный конструктор
    Users.first({this.name='Kirill'}){
      this.surname ='NOskov';
    }

     @override
    String toString()=> 'name= $name  surname=$surname';


    //список  инициализаторов
    Users.birthday(num old){
      age = old;
      date = 2021- old;
    }

   //Перенаправление конструкторов (роль конструктора просто перенаправить на другой коструктор )
   Users.second(String name) : this(name,'Noskov');
}


     //Константный конструктор
      class Constant{
          final x,y;
          const Constant(this.x,this.y);
      }


     //factory конструктор
      class Tropi{

         final String name;

         static final Map<String,Tropi> _cache= <String,Tropi>{};

         factory Tropi(name){
            return _cache.putIfAbsent(name, () => Tropi.Handler(name));
         }
          Tropi.Handler(this.name){
              print('Уже есть такой объект');
          }
      }

    //методы экземпляра
    class Metod{

     final String name;
     final num age;
     final String job;

     Metod(this.name,this.age) : job= 'Student';

       String Datauser(){
         return '$name $age Работа: $job ';
       }
     }

    //getter and setter
      class Get_Set {
          num first_age,second_age,sum=1;
          Get_Set(this.first_age,this.second_age);

          num get total_age => first_age+second_age;
          set minus_age(num val)=> sum=total_age-val;
      }

    //абстрактные классы ,  метод
       abstract class Abstract{
          void printername();
       }

       class textPrint extends Abstract{
         printername(){
           print('Hello avada !!!');
         }
       }
    // Неявные интерфейсы
     class absInterf{
        final _name ;
        absInterf(this._name);
        String takeName(String anotherName) => 'Hi $anotherName , Меня зовут $_name';
     }

     class NameAbstract implements absInterf{                     // print(exitText(absInterf('Kirill')));
                                                                  // print(exitText(NameAbstract()))
       get _name => '';
        String takeName(String anotherName) => 'Как дела $anotherName';
     }
      String exitText(absInterf user) => user.takeName('Alex');


    // Extension (расширение) типа
    extension NumberParsing on String{
        int parseInt(){
          return int.parse(this);
        }

       double parseDouble(){
         return double.parse(this);
       }
     }


    // noSuchMethod
    class noMethod{

      @override
       void noSuchMethod(Invocation inv){
         print('Не реализованный метод ${inv.memberName}');
       }

        void print_hi();
    }


    // static переменные и методы класса
    class statMethod{

    static const PI=3.14;
    static void priText() => print('Static Hello ))');
    }


    // перечисления
    enum Color {red,green,blue}
    List<Color> colors = Color.values;


    //миксины
    mixin Parameters{
      num default_Age = 20;
      String default_Name = 'Kirill';

      String somePrint() => ' возраст: ';
    }

    class User1 {
      var nameUser1 = 'Alex';
      var ageUser1 = 36;

    }

    class User2 extends User1 with Parameters{

      var userName2;
      var userAge2;
      User2(this.userName2,this.userAge2);


    }


    //асинхронное выполнение
    void task1() => print('Задача 1 выполнена');

    Future<String> task2() async{
        String result='';
        await Future.delayed(Duration(seconds: 2),(){
        result = 'task2()';
         });
        return result;
    }


    void task3(String resultTask2)=> print('Задача выполнена с данными из $resultTask2');

   Future<void> MainAsyn() async{
    task1();
       try{
          String  task2Result = await task2();
          task3(task2Result);

         }catch(error){
           print(error);
         }
    }
//potok
Future Streams() async{

     Duration interval = Duration(seconds: 1);
     Stream<int> streams= Stream<int>.periodic(interval, (x) => (x + 1) * 2);


     streams = streams.take(5);

     await for(int i in streams) print(i);

}
// Typedefs

typedef Compare
/************************_Реализация классов и объектов_**************************************/

void OOP()
{
//   var user = Users();
//
// user.name='Kirill';
// user.surname='Noskov';
// print('${user.name} ${user.surname}\n');


   //Конструкторы и именованные конструкторы
   var user2 = Users('KIRIL','NOSKOV');
   print('${user2.name} ${user2.surname}\n');

   var user3 = Users.first();
   print('${user3.surname}  ${user3.name}');

   var user4 = Users.first(name: 'Alex');
   print(user4);


   //Список инициализаторов
   var user5 = Users.birthday(20);
   print("\nage: ${user5.age} year of birthday:${user5.date}\n");

   //Перенаправление конструкторов
   var user6 = Users.second('Kiril');
   print(user6);


   print('\n');
   //константный конструктор
   var user7 = const Constant(1,1);
   var user8 = const Constant(1,1);
   print(user7 == user8);

   print('\n');
   //factory конструктор
   var p = Tropi('Chunga');
   print(p.name);
   var p1 = Tropi('Chunga');


   print('\n');
   //методы экземпляра
   var user9 = Metod('Kirill',20);
   print(user9.Datauser());

   print('\n');
   // Getter - Setter
   var user10 = Get_Set(10, 20);
   print('${user10.first_age} + ${user10.second_age} = ${user10.total_age}');
   user10.minus_age=10;
   print('Total= ${user10.total_age} - 10  = ${user10.sum}');


   print('\n');
   // Абстрактный class
   var user11 = textPrint();
   user11.printername();

   print('\n');
   //Неявные интерфейсы
   print(exitText(absInterf('Kirill')));
   print(exitText(NameAbstract()));

   print('\n');
   //Extention (расширение) типа
   print('121'.parseInt());
   print('1.13'.parseDouble());

   print('\n');
   // noSuchMethod()
   var user12=noMethod();
   user12.print_hi();

   print('\n');
   // Static переменные и методы
   print(statMethod.PI);
   statMethod.priText();

   print('\n');
   //перечисление
   print(colors);
   var redColor = Color.red;
   var blueColor = Color.blue;

   print('\n');
   //миксины
    var user13 = User2('Anton',12);
    print('User default name: ${user13.default_Name}  and age: ${user13.default_Age}');
    print('User1 name : ${user13.nameUser1} ${user13.somePrint()} ${user13.ageUser1}');
    print('User2 name: ${user13.userName2} возраст: ${user13.userAge2}');

   print('\n');
   //асинхронное  выполнение
    MainAsyn();
    print("Задачи выполняются ");

    Streams();


}



void main() {


print('\n**********************');
print('\t''Main Menu '
    '\n Choose number of function:'
    '\n 1. Variables() '
    '\n 2.Collection()'
    '\n 3. if_Cycle()'
    '\n 4. Func()'
    '\n 5. OOP()');
print('**********************');
print('Enter  number: ');
var numbers= int.parse(stdin.readLineSync()!);
switch(numbers)
{
  case 1: Variables();
  break;
  case 2: Collection();
  break;
  case 3: if_Cycle();
  break;
  case 4: Func();
  break;
  case 5: OOP();
  break;

}



}















