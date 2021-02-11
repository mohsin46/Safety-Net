import 'package:flutter/material.dart';

class HelpLine extends StatefulWidget {
  @override
  _HelpLineState createState() => _HelpLineState();
}

class _HelpLineState extends State<HelpLine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Helpline Numbers'),
      ),
      body: Column(
        children: [
          Expanded(child: HelpLineView()),
        ],
      ),
    );
  }
}

class HelpLineView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView2(context);
  }
}

Widget _myListView2(BuildContext context) {
  // backing data
  final learnings2 = [
    'NATIONAL EMERGENCY NUMBER : - 112 ',
    'POLICE NUMBER : - 100 ',
    'AMBULANCE-102',
    'WOMEN HELPLIINE NUMBER: - 1091',
    'WOMEN HELPLIINE(DOMESTIC ABUSE): - 181',
    'DISASTER MANAGEMENT SERVICES: - 108',
    'Deputy Commissioner Of Police – Missing Child And Women: - 1094',
    'Railway Accident Emergency Service: - 1072',
    'Road Accident Emergency Service: - 1073'
  ];

  return ListView.separated(
    itemCount: learnings2.length,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text(learnings2[index]),
      );
    },
    separatorBuilder: (context, index) {
      return Divider(
        thickness: 3,
      );
    },
  );
}

class DosAndDonts extends StatefulWidget {
  @override
  _DosAndDontsState createState() => _DosAndDontsState();
}

class _DosAndDontsState extends State<DosAndDonts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Do\'s and Don\'ts'),
      ),
      body: Column(
        children: [
          Expanded(child: DosAndDontsview()),
        ],
      ),
    );
  }
}

class DosAndDontsview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView4(context);
  }
}

Widget _myListView4(BuildContext context) {
  // backing data
  final learnings4 = [
    'Be aware of your surroundings. Don’t let your guard down ',
    'While using 2 wheeler be sure to wear helmet at all times.',
    'Don’t stop for any stranger(especially at night).',
    'While driving a car: \n  1. Avoid parking at desolate area \n  2. Look inside the car especially the back seat before unlocking & entering '
        '\n  3.  Lock the doors immediately after entering the car \n  4.  Start the car & drive off rather then call someone. Calls can wait'
        '\n  5. Don’t give lift to strangers \n  6. Don’t stop your car for strangers, especially at night'
        '\n  7. Take known routes, avoid short cuts which you don’t know',
    'Ensure that doors of the house are properly locked',
    'Ensure you carry a pepper spray for you for emergencies',
    'Know some self defence technniques if you dont you can checkout our section for thr same'
  ];
  return ListView.separated(
    itemCount: learnings4.length,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text(learnings4[index]),
      );
    },
    separatorBuilder: (context, index) {
      return Divider(
        thickness: 3,
      );
    },
  );
}

class DomesticViolence extends StatefulWidget {
  @override
  _DomesticViolenceState createState() => _DomesticViolenceState();
}

class _DomesticViolenceState extends State<DomesticViolence> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Know you are being abused'),
      ),
      body: Column(
        children: [
          Expanded(child: DomesticViolenceView()),
        ],
      ),
    );
  }
}

class DomesticViolenceView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView5(context);
  }
}

Widget _myListView5(BuildContext context) {
  // backing data
  final learnings5 = [
    'Your partner keeps track of everything you do. They monitor where you are and whom you are with at all times. They prevent or discourage you from seeing friends, family, or going to work or school. ',
    'An abusive partner may act jealous, including constantly accusing you of cheating. They may attempt to control how you spend money and your use of medications or birth control. They may make everyday decisions for you, such as what you wear or eat.',
    'They may be sexually abusive, including rape or other forced sexual activity. They may incorrectly assume that consent for a sex act in the past means that you must participate in the same acts in the future. They may also incorrectly assume that consent for one activity means consent for increased levels of intimacy. For example, an abuser may assume that a kiss should lead to sex every time.',
    'They may hurt you physically, such as hitting, beating, pushing, shoving, punching, slapping, kicking, or biting. They may use, or threaten to use, a weapon against you..',
    'An abusive partner may threaten to turn you in to authorities for illegal activity if you report the abuse, or if you resist.',
    'You partner insists that you reply right away to their texts, emails, and calls, and demands to know your passwords to social media sites, email, and other accounts.',
    'They may be demeaning. They may put you down by insulting your appearance, intelligence, or interests. They may try to humiliate you in front of others and attempt to destroy your property or things that you care about.'
  ];
  return ListView.separated(
    itemCount: learnings5.length,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text(learnings5[index]),
      );
    },
    separatorBuilder: (context, index) {
      return Divider(
        thickness: 3,
      );
    },
  );
}

class Stalker extends StatefulWidget {
  @override
  _StalkerState createState() => _StalkerState();
}

class _StalkerState extends State<Stalker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Know the signs of a stalker'),
      ),
      body: Column(
        children: [
          Expanded(child: StalkerView()),
        ],
      ),
    );
  }
}

class StalkerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView6(context);
  }
}

Widget _myListView6(BuildContext context) {
  // backing data
  final learnings6 = [
    'Repeatedly call, message, and/or text you, including hang-ups',
    'Follow you and show up wherever you are',
    'Send unwanted gifts, letters, cards, or e-mails',
    'Damage your home, car, or other property',
    'Use technology, like hidden cameras, apps or GPS to track you',
    'Drive by or hang out at your apartment/residence hall,outside your classroom or at your work',
    'Monitor your phone calls, computer use, or social network account(s)',
    'Threaten to hurt you, your family, friends or pets',
    'Find out about you by using public records or online search services, hiring private investigators, going through your garbage, or contacting your friends, classmates, family, neighbors, or co-workers',
  ];
  return ListView.separated(
    itemCount: learnings6.length,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text(learnings6[index]),
      );
    },
    separatorBuilder: (context, index) {
      return Divider(
        thickness: 3,
      );
    },
  );
}

class CyberHarassments extends StatefulWidget {
  @override
  _CyberHarassmentsState createState() => _CyberHarassmentsState();
}

class _CyberHarassmentsState extends State<CyberHarassments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Know the signs of abuse'),
      ),
      body: Column(
        children: [
          Expanded(child: CyberHarassmentsView()),
        ],
      ),
    );
  }
}

class CyberHarassmentsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView7(context);
  }
}

Widget _myListView7(BuildContext context) {
  // backing data
  final learnings7 = [
    'Sending unsolicited and/or threatening e-mail.',
    'Encouraging others to send the victim unsolicited and/or threatening e-mail or to overwhelm the victim with e-mail messages.',
    'Sending viruses by e-mail (electronic sabotage).',
    'Spreading rumours.',
    'Making defamatory comments about the victim online.',
    'Sending negative messages directly to the victim.',
    'Impersonating the victim online by sending an inflammatory, controversial or enticing message which causes others to respond negatively to the victim.',
    'Harassing the victim during a live chat.',
    'Find out about you by using public records or online search services, hiring private investigators, going through your garbage, or contacting your friends, classmates, family, neighbors, or co-workers',
  ];
  return ListView.separated(
    itemCount: learnings7.length,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text(learnings7[index]),
      );
    },
    separatorBuilder: (context, index) {
      return Divider(
        thickness: 3,
      );
    },
  );
}

class PenalCode extends StatefulWidget {
  @override
  _PenalCodeState createState() => _PenalCodeState();
}

class _PenalCodeState extends State<PenalCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('KNOW YOUR RIGHTS'),
      ),
      body: Column(
        children: [
          Expanded(child: PenalCodeView()),
        ],
      ),
    );
  }
}

class Emergencies extends StatefulWidget {
  @override
  _EmergenciesState createState() => _EmergenciesState();
}

class _EmergenciesState extends State<Emergencies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('DON\'T BE AFRAID'),
      ),
      body: Column(
        children: [
          Expanded(child: EmergenciesView()),
        ],
      ),
    );
  }
}

class EmergenciesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView8(context);
  }
}

Widget _myListView8(BuildContext context) {
  // backing data
  final learnings8 = [
    'Domestic Abuse \n 1.Sometimes stopping all communication with an abuser can be dangerous. However, if it’s safe to do so, stop all contact and communication with the person stalking or harassing you but keep any evidence of the stalking (such as voicemails, texts, emails, etc.,) for future court cases or criminal actions. If it’s not safe to stop all communication, you may want to limit them as much as possible. \n 2.Carry a cell phone with you. Keep handy or memorize emergency phone numbers that you can use in case of an emergency. If you ever feel you are in immediate danger, call 911. You may also be eligible for a free phone with free minutes from a phone company such as the Assurance Wireless Program, sponsored by Virgin Mobile (WomensLaw is not affiliated with this program).. '
        '\n 3.seek help Your health care provider \n 4.if situation goes out of hands then A local women\'s shelter or crisis center'
        '\n 5.A counseling or mental health center \n 6.A local court.',
    'Encouraging others to send the victim unsolicited and/or threatening e-mail or to overwhelm the victim with e-mail messages.\'Domestic Abuse \n 1.contact Someone you trust. \n 2.contact National Domestic Violence Hotline: 800-799-SAFE (800-799-7233). '
        '\n 3.Trust your instincts. If you feel uncomfortable for any reason, you may want to reach out for help, even if nothing immediately dangerous is happening. \n 4.if situation goes out of hands then A local women\'s shelter or crisis center \n 4.Have a safe place in mind to go to in an emergency. You might go to a police station, place of worship, public area, the home of a family member or friend (unknown to the stalker), or a domestic violence shelter. If someone is following you, it is generally not a good idea to go home.'
        '\n 5.ry not to travel alone. If you run or walk for exercise, you might want to get an exercise buddy to go with you. Always try to vary your routes to and from work or school, the grocery store, and any other places regularly visited. By changing your daily routes, it could make it more difficult for someone to learn your routine – however, also be aware that a stalker may put a GPS monitoring device on your car or cell phone. One hint that a GPS device may be installed is if you are varying your routes or going to unexpected places but the stalker still seems to find you. \n 6.Alert the three credit bureaus and ask to have a fraud alert put on your credit reports: Experian (888) 397-3742, Equifax (888) 766-0008, and TransUnion (877) 322-8228. A stalker may try to obtain your Social Security Number and/or mother’s maiden name to use this information to obtain your credit information. Putting an alert on your credit could help to prevent this and possible fraudulent activity and/or identity theft. For more information on fraud alerts, you can go to What is a fraud alert and should I get one? on WomensLaw.org’s Financial Abuse page..',
  ];
  return ListView.separated(
    itemCount: learnings8.length,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text(learnings8[index]),
      );
    },
    separatorBuilder: (context, index) {
      return Divider(
        thickness: 3,
      );
    },
  );
}

class PenalCodeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView3(context);
  }
}

Widget _myListView3(BuildContext context) {
  // backing data
  final learnings3 = [
    'Punishment for rape (Sections 375, 376, 376A, 376B, 376C, 376D and 376E) ',
    'Kidnapping and Abduction for different purposes (Sections 363 to 373)',
    'Assault or criminal force to woman with intent to outrage her modesty (Section 354)',
    'Sexual harassment and punishment for sexual harassment (Section 354A)',
    'Assault or use of criminal force to woman with intent to disrobe.(Section 354B)',
    'Voyeurism.—Any man who watches, or captures the image of a woman engaging in a private act in circumstances where she would usually have the expectation of not being observed either by the perpetrator or by any other person(Section 354C)',
    'Stalking (Section 354D)',
    'Acid Attack (Section 326A and 326B)',
    'Dowry Death, Murder, Abetment of Sucide (Section 304B , 302, 306)',
    'Word , gesture or act intended to insult the modesty of a woman (Section 509)'
  ];
  return ListView.separated(
    itemCount: learnings3.length,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text(learnings3[index]),
      );
    },
    separatorBuilder: (context, index) {
      return Divider(
        thickness: 3,
      );
    },
  );
}
