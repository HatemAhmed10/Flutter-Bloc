import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../cubit/cubit.dart';

//------------------------------------------------------
void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);
void navigateAndFinish(
    context,
    widget,
    ) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
          (route) {
        return false;
      },
    );


Widget buildListProduct(context) =>
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => Container(
                  child: Row(
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage: NetworkImage(
                                'https://avatars.githubusercontent.com/u/34492145?v=4'),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Abdullah Ahmed Abdullah Ahmed Abdullah Ahmed Abdullah Ahmed',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Row(
                              children:
                              [
                                Expanded(
                                  child: Text(
                                    'hello my name is abdullah ahmed hello my name is abdullah ahmed',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0,
                                  ),
                                  child: Container(
                                    width: 7.0,
                                    height: 7.0,
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                Text(
                                  '02:00 pm',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
              ),
              separatorBuilder: (context, index) => SizedBox(
                height: 30.0,
              ),
              itemCount: 10,
            ),
          ],
        ),
      ),
    );

// ignore: non_constant_identifier_names
Widget SbahGUI2(context){
  AppCubit cubit = AppCubit.get(context);
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              color: Colors.green,
              width: double.infinity,
              height: 150,
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [
                              Text("سبحان الله"),
                              SizedBox(width: 10,),
                              cubit.counter >= 31 ? CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.blue,
                                child: Icon(Icons.add),
                              )
                              : Text("")
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [
                              Text("الحمد لله"),
                              SizedBox(width: 10,),
                              cubit.counter >= 62 ? CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.blue,
                                child: Icon(Icons.add),
                              )
                                  : Text("")
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.blue,
                                child: Text(cubit.counter.toString()),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("لا إله إلّا الله"),
                              SizedBox(width: 10,),
                              cubit.counter >= 93 ? CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.blue,
                                child: Icon(Icons.add),
                              )
                                  : Text("")
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("الله أكبر"),
                              SizedBox(width: 10,),
                              cubit.counter >= 124 ? CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.blue,
                                child: Icon(Icons.add),
                              )
                                  : Text("")
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              )
          ),
          Container(
            color: Colors.pink,
            width: double.infinity,
            height: 250,
            child: IconButton(
              icon: const CircleAvatar(
                radius: 675,
                backgroundColor: Colors.blue,
              ),
              onPressed: () {
               // var cubit = AppCubit.get(context);
                cubit.changecounter();

              },
            ),
          ),
        ],
      ),
    ),
  ) ;
}


Widget HadesGUI(context) =>
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("هنا الحديث ",
              style:TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );







//
// var now = new DateTime.now();
// var formatter = new DateFormat('yyyy-MM-dd');
// String formattedDate2 = DateFormat('kk:mm:ss').format(now);
// String formattedDate = formatter.format(now);
// String HourformattedDate = DateFormat('kk').format(now);
// int hour  = int.parse(HourformattedDate) ;
//
//
//
// Widget buildViewWidget(context) =>
//     Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Container(
//         child: Column(
//           children: [
//             if(hour >5 && hour <= 12)...{
//               Text("الفجر"),
//             }else if(hour >12 && hour <= 15)...{
//               Text("الظهر"),
//             }else if(hour >15 && hour <= 18)...{
//               Text("العصر"),
//             }else if(hour >18 && hour <= 20)...{
//               Text("المغرب"),
//             }
//             else if(hour >20 && hour <= 5)...{
//               Text("العشاء"),
//               }
//             else...{
//               Text("Error"),
//                 }
//
//           ],
//         ),
//       ),
//     );
