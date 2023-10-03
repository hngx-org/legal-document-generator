import 'package:flutter/material.dart';

class Subscription extends StatefulWidget {
  const Subscription({super.key});

  @override
  State<Subscription> createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subscription'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Column(
        children: [
          Card(
            color: const Color.fromARGB(255, 255, 255, 255),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Subscribe\n Newspapers of\n your choice',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(
                  width: 10,
                ),
                Image.asset(
                  'assets/images/subpp.png',
                  height: 150,
                  width: 160,
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 430,
            child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    //color: Colors.blue,
                    height: 430,
                    width: 320,
                    decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Expanded(
                      child: Column(
                        children: [
                          const Text(
                            'Starter',
                            style: TextStyle(fontSize: 24),
                          ),
                          const Text(
                            "\$3",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Container(
                            height: 2,
                            width: 200,
                            color: Colors.black,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          const Text('Stay on top of the news'),
                          const SizedBox(
                            height: 25,
                          ),
                          const Text('Personalise Recommendations'),
                          const SizedBox(
                            height: 25,
                          ),
                          const Text('Ad free experience'),
                          const SizedBox(
                            height: 25,
                          ),
                          const Text('Topics of interest selected by you'),
                          const SizedBox(
                            height: 25,
                          ),
                          Container(
                            height: 50,
                            width: 150,
                            decoration: const BoxDecoration(
                                color: Colors.purple,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: const Center(
                              child: Text(
                                'Get Started',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    //color: Colors.blue,
                    height: 430,
                    width: 320,
                    decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Expanded(
                      child: Column(
                        children: [
                          const Text(
                            'Starter',
                            style: TextStyle(fontSize: 24),
                          ),
                          const Text(
                            "\$6",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Container(
                            height: 2,
                            width: 200,
                            color: Colors.black,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          const Text('Stay on top of the news'),
                          const SizedBox(
                            height: 25,
                          ),
                          const Text('Personalise Recommendations'),
                          const SizedBox(
                            height: 25,
                          ),
                          const Text('Ad free experience'),
                          const SizedBox(
                            height: 25,
                          ),
                          const Text('Topics of interest selected by you'),
                          const SizedBox(
                            height: 25,
                          ),
                          Container(
                            height: 50,
                            width: 150,
                            decoration: const BoxDecoration(
                                color: Colors.purple,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: const Center(
                              child: Text(
                                'Get Started',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  )
                ]),
          )
        ],
      ),
    );
  }
}
