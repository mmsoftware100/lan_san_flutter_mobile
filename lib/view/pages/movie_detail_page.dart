// import 'dart:ui';
//
// import 'package:flutter/material.dart';
// import 'better_video_player_page.dart';
//
// class MovieDetialPage extends StatefulWidget {
//   String movieName;
//   String posterUrl;
//   String movieUrl;
//   MovieDetialPage(
//       this.movieName,
//       this.posterUrl,
//       this.movieUrl
//       );
//
//   @override
//   State<MovieDetialPage> createState() => _MovieDetialPageState();
// }
//
// class _MovieDetialPageState extends State<MovieDetialPage> {
//
//   final String description =
//       "After more than thirty years of service as one of the Navy’s top aviators, Pete “Maverick” Mitchell (Tom Cruise) is where he belongs, pushing the envelope as a courageous test pilot and dodging the advancement in rank that would ground him. When he finds himself training a detachment of Top Gun graduates for a specialized mission the likes of which no living pilot has ever seen, Maverick encounters Lt. Bradley Bradshaw (Miles Teller), call sign: “Rooster,” the son of Maverick’s late friend and Radar Intercept Officer Lt. Nick Bradshaw, aka “Goose”. Facing an uncertain future and confronting the ghosts";
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           onPressed: (){
//             Navigator.of(context).pop();
//           },
//           icon: Icon(Icons.arrow_back,color: Colors.black,),
//         ),
//         title: Text("Details",style: TextStyle(color: Colors.black),),
//       ),
//       body: ListView(
//         children: [
//           // Container(
//           //   height: MediaQuery.of(context).size.height/3,
//           //   decoration: new BoxDecoration(
//           //     image: new DecorationImage(
//           //       image: new NetworkImage(widget.posterUrl),
//           //       fit: BoxFit.cover,
//           //     ),
//           //   ),
//           //   child: new BackdropFilter(
//           //     filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
//           //     child: new Container(
//           //       decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)),
//           //     ),
//           //   ),
//           // ),
//
//           Stack(
//             children: <Widget>[
//               //First thing in the stack is the background
//               //For the backgroud i create a column
//               Column(
//                 children: <Widget>[
//                   //first element in the column is the white background (the Image.asset in your case)
//                   DecoratedBox(
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20.0),
//                           color: Colors.white
//                       ),
//                       child: Container(
//                         // width: 300.0,
//                         // height: 400.0,
//                         width: MediaQuery.of(context).size.width,
//                         height: MediaQuery.of(context).size.height/5,
//                         decoration: new BoxDecoration(
//                           image: new DecorationImage(
//                             image: new NetworkImage(widget.posterUrl),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                         child: new BackdropFilter(
//                           filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
//                           child: new Container(
//                             decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)),
//                           ),
//                         ),
//                       )
//                   ),
//                   //second item in the column is a transparent space of 20
//                   // Container(
//                   //     height: 20.0
//                   // )
//                 ],
//               ),
//               //for the button i create another column
//               Column(
//                   children:<Widget>[
//                     //first element in column is the transparent offset
//                     Container(
//                       // height: 380.0
//                       height: MediaQuery.of(context).size.height/9,
//                     ),
//                     Center(
//                       // child: ElevatedButton(
//                       //   child: Text("Press Me"),
//                       //   onPressed: () {},
//                       // ),
//                       child: Container(
//                         height: 200,
//                         child: MoviePosterCard(
//                           imgAssetPath:widget.posterUrl,
//                         ),
//                       ),
//                     ),
//                     Text("Movie Title"),
//                     SizedBox(height: 20,),
//                     Text("Movie Category"),
//                     Padding(
//                       padding: const EdgeInsets.all(18.0),
//                       child: TextButton(
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Icon(Icons.play_arrow),
//                               SizedBox(width: MediaQuery.of(context).size.width/80,),
//                               Text(
//                                   "Play Now".toUpperCase(),
//                                   style: TextStyle(fontSize: 14)
//                               )
//                             ],
//                           ),
//                           style: ButtonStyle(
//                               padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
//                               foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
//                               backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
//                               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                                   RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(18.0),
//                                       side: BorderSide(color: Colors.red)
//                                   )
//                               )
//                           ),
//                           onPressed: () {
//                             // Navigator.push(context, MaterialPageRoute(builder: (context) => Videoplayers(
//                             //   videodata: 'https://assets.mixkit.co/videos/preview/mixkit-forest-stream-in-the-sunlight-529-large.mp4',
//                             // )));
//
//                             Navigator.push(context, MaterialPageRoute(builder: (context)=>VideoPlayerPage(
//                                 widget.movieName,
//                                 widget.posterUrl,
//                                 widget.movieUrl
//                             )));
//                             // Navigator.push(context, MaterialPageRoute(builder: (context)=>SingleTab()));
//
//
//                             // Navigator.push(context, MaterialPageRoute(builder: (context)=>SingleTab()));
//                             // Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage(title: "Hello",)));
//
//                           }
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: new Container(
//                         child: new DescriptionTextWidget(text: description),
//                       ),
//                     ),
//
//                     Padding(
//                       padding: const EdgeInsets.all(18.0),
//                       child: Row(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: TextButton(
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Icon(Icons.add),
//                                     SizedBox(width: MediaQuery.of(context).size.width/80,),
//                                     Text(
//                                         "My List".toUpperCase(),
//                                         style: TextStyle(fontSize: 14)
//                                     )
//                                   ],
//                                 ),
//                                 style: ButtonStyle(
//                                     padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
//                                     foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
//                                     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                                         RoundedRectangleBorder(
//                                             borderRadius: BorderRadius.circular(18.0),
//                                             side: BorderSide(color: Colors.black)
//                                         )
//                                     )
//                                 ),
//                                 onPressed: () => null
//                             ),
//                           ),
//                           TextButton(
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Icon(Icons.share),
//                                   SizedBox(width: MediaQuery.of(context).size.width/80,),
//                                   Text(
//                                       "Share".toUpperCase(),
//                                       style: TextStyle(fontSize: 14)
//                                   )
//                                 ],
//                               ),
//                               style: ButtonStyle(
//                                   padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
//                                   foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
//                                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                                       RoundedRectangleBorder(
//                                           borderRadius: BorderRadius.circular(18.0),
//                                           side: BorderSide(color: Colors.black)
//                                       )
//                                   )
//                               ),
//                               onPressed: () => null
//                           ),
//                         ],
//                       ),
//                     ),
//
//                     TabLayoutWidget(),
//
//                   ]
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }