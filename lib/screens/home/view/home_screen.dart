import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_user_detail/screens/home/model/homeModel.dart';
import 'package:random_user_detail/screens/home/provider/homeProvider.dart';

class home_screen extends StatefulWidget {
  const home_screen({Key? key}) : super(key: key);

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  homeProvider? ht, hf;

  @override
  void initState() {
    super.initState();

    Provider.of<homeProvider>(context, listen: false).userApiCall();
  }

  @override
  Widget build(BuildContext context) {
    ht = Provider.of<homeProvider>(context, listen: true);
    hf = Provider.of<homeProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
          // backgroundColor: Colors.black,
          appBar: AppBar(
            title: Text("Random Users details",
                style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.black,
            actions: [
              IconButton(onPressed: () {
                ht!.changeIndex();
              }, icon: Icon(Icons.refresh_rounded,color: Colors.white,size: 30,))
            ],
          ),
          body: FutureBuilder(
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("${snapshot.error}");
              } else if (snapshot.hasData) {
                UserModel? u1 = snapshot.data;
                List<Result> l1 = u1!.results;
                return Center(
                  child: Container(
                    height: 560,
                    width: double.infinity,
                    margin: EdgeInsets.all(25),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Column(
                        children: [
                          Container(
                              height: 120,
                              width: 120,
                              margin: EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(60),
                                    child: Image.network(
                                      "${l1[0].picture.large}",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              )
                          ),
                          SizedBox(height: 20,),
                          Text("${l1[0].id.name}",style: TextStyle(color: Colors.white,fontSize: 25)),
                          SizedBox(height: 10,),
                          Text("${l1[0].name.title}  ${l1[0].name.first}  ${l1[0].name.last}",style: TextStyle(color: Colors.white,fontSize: 25)),
                          SizedBox(height: 15,),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.email,color: Colors.white,size: 25),
                                    SizedBox(width: 15,),
                                    Text("${l1[0].email}",style: TextStyle(color: Colors.white,fontSize: 15)),
                                  ],
                                ),
                                SizedBox(height: 15,),
                                Row(
                                  children: [
                                    Icon(Icons.person,color: Colors.white,size: 25),
                                    SizedBox(width: 15,),
                                    Text("${l1[0].gender}",style: TextStyle(color: Colors.white,fontSize: 15)),
                                  ],
                                ),
                                SizedBox(height: 15,),
                                Row(
                                  children: [
                                    Icon(Icons.call,color: Colors.white,size: 25),
                                    SizedBox(width: 15,),
                                    Text("${l1[0].phone}",style: TextStyle(color: Colors.white,fontSize: 15)),
                                  ],
                                ),
                                SizedBox(height: 15,),
                                Row(
                                  children: [
                                    Icon(Icons.telegram,color: Colors.white,size: 25),
                                    SizedBox(width: 15,),
                                    Text("${l1[0].cell}",style: TextStyle(color: Colors.white,fontSize: 15)),
                                  ],
                                ),
                                SizedBox(height: 15,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(Icons.location_on,color: Colors.white,size: 25),
                                    SizedBox(width: 15,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("${l1[0].location.street.number}, ${l1[0].location.street.name}",style: TextStyle(color: Colors.white,fontSize: 15)),
                                        Text("${l1[0].location.city}, ${l1[0].location.state}",style: TextStyle(color: Colors.white,fontSize: 15)),
                                        Text("${l1[0].location.country} - ${l1[0].location.postcode}",style: TextStyle(color: Colors.white,fontSize: 15)),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
              return CircularProgressIndicator();
            },
            future: hf!.userApiCall(),
          )),
    );
  }
}
