import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class McDonaldPage extends StatefulWidget {
  const McDonaldPage({super.key});

  @override
  State<McDonaldPage> createState() => _McDonaldPageState();
}

class _McDonaldPageState extends State<McDonaldPage> {
  final List<Map<String, dynamic>> _menu = [
    {
      "Name": "PaNas 1 Ayam Spicy McD Black Pepper",
      "Price": "43.000",
      "Image":
          "https://i.gojekapi.com/darkroom/gofood-indonesia/v2/images/uploads/293efca3-8bd5-4b29-bdd2-740948c08e5c_TPO-111462_1.jpg?auto=format",
    },
    {
      "Name": "PaNas 2 with Fries Ayam Spicy McD Black Pepper Large",
      "Price": "69.500",
      "Image":
          "https://i.gojekapi.com/darkroom/gofood-indonesia/v2/images/uploads/b98b4e24-553e-400f-bf42-5bf613c0db0f_MAIN_023_20250121002231.jpeg?auto=format",
    },
    {
      "Name": "Paket Hemat Big Mac, Medium",
      "Price": "59.000",
      "Image":
          "https://i.gojekapi.com/darkroom/gofood-indonesia/v2/images/uploads/fec62b3c-0451-4e2c-afa3-fb84e1f483ee_TPO-100324_1.jpg?auto=format",
    },
    {
      "Name": "Big Mac",
      "Price": "44.500",
      "Image":
          "https://i.gojekapi.com/darkroom/gofood-indonesia/v2/images/uploads/e0d2b1e0-0822-4e4e-a52f-83e76fe7c5d3_TPO-100323_1.jpg?auto=format",
    },
    {
      "Name": "Cheeseburger Deluxe",
      "Price": "35.000",
      "Image":
          "https://i.gojekapi.com/darkroom/gofood-indonesia/v2/images/uploads/7567aaef-0ca4-486a-a78b-dfce35d27e76_TPO-100317_1.jpg?auto=format",
    },
  ];
  final List<Map<String, dynamic>> _beverage = [
    {
      "Name": "McFloat Fanta",
      "Price": "12.000",
      "Image":
          "https://i.gojekapi.com/darkroom/gofood-indonesia/v2/images/uploads/f658a196-fec5-4cad-a0cf-f4a06a997055_TPO-133190_0.jpg?auto=format",
    },
    {
      "Name": "Iced Coffee Jelly Float",
      "Price": "23.000",
      "Image":
          "https://i.gojekapi.com/darkroom/gofood-indonesia/v2/images/uploads/e860e84a-ecf5-4cc7-85e2-a8a3a97e5007_TPO-134005_1.jpg?auto=format",
    },
    {
      "Name": "Coke Float",
      "Price": "12.000",
      "Image":
          "https://i.gojekapi.com/darkroom/gofood-indonesia/v2/images/uploads/3c942fbb-1408-4fe7-95d1-4fd1f772f0c7_TPO-133191_0.jpg?auto=format",
    },
  ];

  late List<int> totalMenu = List.filled(_menu.length, 0);
  late List<int> totalBeverage = List.filled(_beverage.length, 0);

  @override
  void initState() {
    super.initState();
    totalMenu = List.filled(_menu.length, 0);
    totalBeverage = List.filled(_beverage.length, 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          //appBar
          SliverAppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              style: IconButton.styleFrom(
                backgroundColor: Colors.white,
                shape: CircleBorder(),
                elevation: 3,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            backgroundColor: Colors.green,
            pinned: true,
            centerTitle: false,
            expandedHeight: 200,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'McDonald\'s, Kaliurang',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              background: Image(
                image: NetworkImage(
                  'https://i.gojekapi.com/darkroom/gofood-indonesia/v2/images/uploads/65bca3be-aec9-4b3a-b72a-a8866bd0f55d_brand-image_1735791800580.jpg?auto=format',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          //description resto
          SliverToBoxAdapter(
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    'Eksklusif Delivery',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          //listView food
          SliverList.separated(
            itemBuilder: (BuildContext context, int index) {
              final menu = _menu[index];
              return Container(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                width: 400,
                height: 150,
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey,
                        image: DecorationImage(
                          image: NetworkImage(menu["Image"]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 300,
                          height: 50,
                          child: Text(
                            menu["Name"],
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              menu["Price"],
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              width: 150,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Row(
                                children: [
                                  OutlinedButton(
                                    onPressed: () {
                                      setState(() {
                                        if (totalMenu[index] > 0) {
                                          totalMenu[index]--;
                                        }
                                      });
                                    },
                                    style: OutlinedButton.styleFrom(
                                      side: BorderSide(
                                        color: Colors.green.shade900,
                                        width: 1,
                                      ),
                                      shape: CircleBorder(),
                                    ),
                                    child: Icon(Icons.remove,
                                        color: Colors.green.shade900),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text('${totalMenu[index]}'),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  OutlinedButton(
                                    onPressed: () {
                                      setState(() {
                                        totalMenu[index]++;
                                      });
                                    },
                                    style: OutlinedButton.styleFrom(
                                      side: BorderSide(
                                          color: Colors.green.shade900,
                                          width: 1),
                                      shape: CircleBorder(),
                                    ),
                                    child: Icon(Icons.add,
                                        color: Colors.green.shade900),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    //button
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(
              indent: 20,
              endIndent: 20,
            ),
            itemCount: _menu.length,
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    'Drinks',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          //listView beverage
          SliverList.separated(
            itemBuilder: (BuildContext context, int index) {
              final beverage = _beverage[index];
              return Container(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                width: 400,
                height: 150,
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey,
                        image: DecorationImage(
                          image: NetworkImage(beverage["Image"]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          beverage["Name"],
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Text(
                              beverage["Price"],
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              width: 150,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Row(
                                children: [
                                  OutlinedButton(
                                    onPressed: () {
                                      setState(() {
                                        if (totalBeverage[index] > 0) {
                                          totalBeverage[index]--;
                                        }
                                      });
                                    },
                                    style: OutlinedButton.styleFrom(
                                      side: BorderSide(
                                        color: Colors.green.shade900,
                                        width: 1,
                                      ),
                                      shape: CircleBorder(),
                                    ),
                                    child: Icon(Icons.remove,
                                        color: Colors.green.shade900),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text('${totalBeverage[index]}'),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  OutlinedButton(
                                    onPressed: () {
                                      setState(() {
                                        totalBeverage[index]++;
                                      });
                                    },
                                    style: OutlinedButton.styleFrom(
                                      side: BorderSide(
                                          color: Colors.green.shade900,
                                          width: 1),
                                      shape: CircleBorder(),
                                    ),
                                    child: Icon(Icons.add,
                                        color: Colors.green.shade900),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    //button
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(
              indent: 20,
              endIndent: 20,
            ),
            itemCount: _beverage.length,
          )
        ],
      ),
    );
  }
}
