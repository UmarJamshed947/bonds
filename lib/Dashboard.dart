import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("BONDS TRACKER"),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 18),
      ),
      drawer: Container(
        color: Colors.white,
        width: 255,
        child: ListView(
          children: [
            Container(
              color: Colors.blue,
              height: 150.0,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 130,
                      height: 100,
                      //child: Lottie.asset('assets/images/bus.json'),
                      // child: Image.asset('assets/images/book.png'),
                    )
                  ],
                ),
              ),
            ),
            //Divider(height: 1,color: Colors.black45,thickness: 1,),
            SizedBox(
              height: 12.0,
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text(
                "Profile",
                style: TextStyle(fontSize: 15),
              ),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text(
                "Logout",
                style: TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            // Here the height of the container is 45% of our total height
            //height: size.height * .40,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.greenAccent,
                  Colors.green,
                ],
              ),
              /*image: DecorationImage(
                      image: AssetImage('assets/images/Dashboard/gradient.png'),
                      fit: BoxFit.cover)*/
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
              //child: Lottie.asset('assets/images/anim.json'),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: size.height * .33,
                    width: 10,
                  ),
                  Container(
                    height: size.height * .70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      color: Colors.orangeAccent,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          //Image.asset('assets/images/Dashboard/dashmid.png'),
                          //SvgPicture.asset("assets/images/icon/daytext.svg"),
                          //SizedBox(height: 1,),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: GridView.count(
                                crossAxisCount: 2,
                                childAspectRatio: 3,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                children: <Widget>[
                                  Container(
                                    // padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: MaterialButton(
                                      onPressed: () {
                                        //Get.to(QuizScreen());
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Row(
                                          children: [
                                            // Image.asset(
                                            //     "assets/images/program.png"),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    "FLUTTER",
                                                    style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.black,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Beginner to Advance",
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: MaterialButton(
                                      onPressed: () {
                                        /*Navigator.push(context, MaterialPageRoute(builder: (context)=>Student_detail(
                                  rack: '1',)));*/
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Row(
                                          children: [
                                            // Image.asset(
                                            //     "assets/images/program.png"),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    "JAVA",
                                                    style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.black,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Beginner to Advance",
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: MaterialButton(
                                      onPressed: () {
                                        /*Navigator.push(context, MaterialPageRoute(builder: (context)=>Student_detail(
                                  rack: '1',)));*/
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Row(
                                          children: [
                                            // Image.asset(
                                            //     "assets/images/program.png"),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    "HTML",
                                                    style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.black,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Beginner to Advance",
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: MaterialButton(
                                      onPressed: () {
                                        /*Navigator.push(context, MaterialPageRoute(builder: (context)=>Student_detail(
                                  rack: '1',)));*/
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Row(
                                          children: [
                                            // Image.asset(
                                            //     "assets/images/program.png"),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    "CSS",
                                                    style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.black,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Beginner to Advance",
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          //Image.asset('assets/images/Dashboard/bottom.png'),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
