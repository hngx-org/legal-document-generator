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
        backgroundColor: const Color(0XFFEFA985),
        title: const Text(
          'Subscription',
          style: TextStyle(color: Color(0XFF4D426D)),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      backgroundColor: const Color(0xFF463A6F),
      body: Column(children: [
        const SizedBox(
          height: 10,
        ),
        Card(
          color: const Color.fromARGB(255, 255, 255, 255),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Subscribe\nNewspapers\nof your\nchoice',
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.justify,
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
              const _freeTrial(),
              const SizedBox(
                width: 20,
              ),
              const _starterSubscription(),
              const SizedBox(
                width: 20,
              ),
              const _premiumSubscription(),
              const SizedBox(
                width: 25,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

class _premiumSubscription extends StatelessWidget {
  const _premiumSubscription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.blue,
      height: 430,
      width: 320,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Expanded(
          child: Column(children: [
        Stack(children: [
          Image.asset(
            'assets/images/moneybag.png',
            height: 80,
            width: 80,
          ),
          Positioned(
            left: 15,
            child: Image.asset(
              'assets/images/moneybag.png',
              height: 80,
              width: 80,
            ),
          )
        ]),
        const Text(
          'Premium',
          style: TextStyle(fontSize: 24),
        ),
        const Text(
          "\$6/month",
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
          height: 15,
        ),
        const Text('Generate Lega Doc'),
        const SizedBox(
          height: 15,
        ),
        const Text('Topics of interest selected by you'),
        const SizedBox(
          height: 15,
        ),
        const Text('Ad free experience'),
        const SizedBox(
          height: 15,
        ),
        const Text('Personalise Recommendations'),
        const SizedBox(
          height: 15,
        ),
        Container(
          height: 50,
          width: 150,
          decoration: const BoxDecoration(
              color: Color(0XFFEFA985),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: const Center(
            child: Text(
              'Get Started',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ),
      ])),
    );
  }
}

class _starterSubscription extends StatelessWidget {
  const _starterSubscription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.blue,
      height: 430,
      width: 320,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Expanded(
        child: Column(
          children: [
            Image.asset(
              'assets/images/moneybag.png',
              height: 80,
              width: 80,
            ),
            const Text(
              'Starter',
              style: TextStyle(fontSize: 24),
            ),
            const Text(
              "\$3/month",
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
            const Text('Generate Legal Doc'),
            const SizedBox(
              height: 25,
            ),
            const Text('Topics of interest selected by you'),
            const SizedBox(
              height: 25,
            ),
            const Text('Ad free experience'),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 50,
              width: 150,
              decoration: const BoxDecoration(
                  color: Color(0XFFEFA985),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
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
    );
  }
}

class _freeTrial extends StatelessWidget {
  const _freeTrial({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.blue,
      height: 430,
      width: 320,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Expanded(
        child: Column(
          children: [
            Image.asset(
              'assets/images/trial.png',
              height: 80,
              width: 80,
            ),
            const Text(
              'Free Trial',
              style: TextStyle(fontSize: 24),
            ),
            const Text(
              "\$0/month",
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
            const Text('Generate Legal Doc'),
            const SizedBox(
              height: 25,
            ),
            const Text('Topics of interest selected by you'),
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 50,
              width: 150,
              decoration: const BoxDecoration(
                  color: Color(0XFFEFA985),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
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
    );
  }
}
