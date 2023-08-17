import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedprefrences/models/userModel.dart';
import 'package:sharedprefrences/services/sharedprefrences.dart';

class homePage extends StatefulWidget {
  homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  sharedPref pref = sharedPref();

  User user = User();

  User getUser = User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('save objects in sharedPrefrences'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              onChanged: (data) {
                setState(() {
                  user.name = data;
                });
              },
              decoration: InputDecoration(
                  hintText: 'Name', contentPadding: EdgeInsets.all(20)),
            ),
            TextField(
              onChanged: (data) {
                setState(() {
                  user.age = data;
                });
              },
              decoration: InputDecoration(
                  hintText: 'Age', contentPadding: EdgeInsets.all(20)),
            ),
            TextField(
              onChanged: (data) {
                setState(() {
                  user.location = data;
                });
              },
              decoration: InputDecoration(
                  hintText: 'Location', contentPadding: EdgeInsets.all(20)),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () async {
                      pref.save('user', user);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('saved!'),
                          duration: const Duration(milliseconds: 500)));
                      // print( await pref.load('user'));
                    },
                    child: Text(
                      'save',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    style:
                        ElevatedButton.styleFrom(backgroundColor:Color(0xffD0CFD1),)),
                ElevatedButton(
                    onPressed: () async {
                      //                                  دة بيرجع جيسون
                      try {
                        User userback = User.fromjson(await pref.load('user'));
                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Loaded!'),
                          duration: const Duration(milliseconds: 500)));
                        setState(() {
                          getUser = userback;
                        });
                      }  catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: new Text("Nothing found!"),
                            duration: const Duration(milliseconds: 500)));
                      }
                     
                    },
                    child: Text(
                      'load',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    style:
                        ElevatedButton.styleFrom(backgroundColor:Color(0xffD0CFD1))),
                ElevatedButton(
               
                    onPressed: () {
                      pref.clear('user');
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('clear'),
                          duration: const Duration(milliseconds: 500)));
                     //لازم اعمل سيت ستات عشان يسمع عندي حاله اليوزر     
                      setState(() {
                        getUser = User();
                      });
                    },
                    child: Text(
                      'clear',
                      style: TextStyle(fontSize: 20, color: Colors.black,),
                    ),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Color(0xffD0CFD1))),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              children: [
                Text('Name : ${getUser.name ?? ""}'),
                SizedBox(
                  height: 50,
                ),
                Text('Age : ${getUser.age ?? ""}'),
                SizedBox(
                  height: 50,
                ),
                Text('location : ${getUser.location ?? ""}'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
