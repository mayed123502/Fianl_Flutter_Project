import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/screens/admin/admin_panel.dart';
import 'package:e_commerce/screens/admin/order_details.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ViewOrder extends StatelessWidget {
  static const String id = 'ViewOrder';
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('order').snapshots();
  int orderNum = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pushNamed(context, AdminPanel.id,);
          },
          child: Icon(
            Icons.arrow_back_ios_sharp,
            color: Colors.black.withOpacity(.5),
          ),
        ),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "View Order",
          style: TextStyle(
              color: Colors.black, fontFamily: 'Overlock', fontSize: 25),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
                stream: _usersStream,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("Loading");
                  }

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: ListView(
                        children:
                            snapshot.data.docs.map((DocumentSnapshot document) {
                      orderNum++;

                      Map<String, dynamic> data =
                          document.data();
                      return Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.pushNamed(context, OrderDetails.id,arguments:data['email'] );

                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * .25,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.blue.shade50,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(child: Text("Order Num : $orderNum")),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text("The customer name : ${data['name']}"),
                                    Divider(),
                                    Text("The customer email : ${data['email']}"),
                                    Divider(),
                                    Text(
                                        "The customer address : ${data['address']}"),
                                    Divider(),
                                    Text(
                                        "The date of application : ${data['time']}"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }).toList()),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
