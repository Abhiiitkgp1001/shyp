import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shyp/dummyData/dummydata.dart';
import 'package:shyp/screen/orderDetail.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  var data = [];
  var type = 0;

  @override
  void initState() {
    data = List.from(DummmyData.orders);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text(
            "Orders",
            style: TextStyle(fontSize: 19.sp),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 16.sp),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            type = 0;
                            data = List.from(DummmyData.orders);
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: type == 0
                                  ? Color(0xff00337C)
                                  : Color(0xff62CDFF).withOpacity(0.4),
                              borderRadius: BorderRadius.circular(16)),
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                          child: Text(
                            "All",
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: type == 0
                                    ? Colors.white
                                    : Color(0xff00337C)),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            type = 1;
                            data.clear();
                            for (int i = 0; i < DummmyData.orders.length; i++) {
                              if (DummmyData.orders[i]["status"] == "Pending")
                                data.add(DummmyData.orders[i]);
                            }
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: type == 1
                                  ? Color(0xff00337C)
                                  : Color(0xff62CDFF).withOpacity(0.4),
                              borderRadius: BorderRadius.circular(16)),
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                          child: Text(
                            "Pending",
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: type == 1
                                    ? Colors.white
                                    : Color(0xff00337C)),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            type = 2;
                            data.clear();
                            for (int i = 0; i < DummmyData.orders.length; i++) {
                              if (DummmyData.orders[i]["status"] != "Pending")
                                data.add(DummmyData.orders[i]);
                            }
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: type == 2
                                  ? Color(0xff00337C)
                                  : Color(0xff62CDFF).withOpacity(0.4),
                              borderRadius: BorderRadius.circular(16)),
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                          child: Text(
                            "In-Progress",
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: type == 2
                                    ? Colors.white
                                    : Color(0xff00337C)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  for (int i = 0; i < data.length; i++)
                    Container(
                      margin: EdgeInsets.only(bottom: 16),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => OrderDetails()));
                        },
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          shadowColor: Colors.black38,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 12),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Price Pending",
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: data[i]["status"].toString() ==
                                                  "Pending"
                                              ? Color(0xff62CDFF)
                                                  .withOpacity(0.4)
                                              : Color(0xffAACB73)
                                                  .withOpacity(0.4),
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 5),
                                      child: Text(
                                        data[i]["status"].toString(),
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff00337C)),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.location_on,
                                            color: Colors.black,
                                          ),
                                          Container(
                                            height: 28,
                                            width: 6,
                                            decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                          ),
                                          Icon(
                                            Icons.flag,
                                            color: Colors.black,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 16,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data[i]["from"].toString(),
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff00337C)),
                                        ),
                                        Text(
                                          data[i]["startDate"].toString(),
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xff4F4557)
                                                  .withOpacity(0.6)),
                                        ),
                                        SizedBox(
                                          height: 12,
                                        ),
                                        Text(
                                          data[i]["to"].toString(),
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff00337C)),
                                        ),
                                        Text(
                                          data[i]["endDate"].toString(),
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xff4F4557)
                                                  .withOpacity(0.6)),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${data[i]["tone"].toString()} Tonne · TMT · Open Full Body Truck",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_rounded,
                                      color: Color(0xff4F4557).withOpacity(0.6),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
