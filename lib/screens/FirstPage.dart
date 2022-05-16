import 'package:bloc_app_test/bloc/connected_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ConnectedBloc _connectedBloc = ConnectedBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text('First Page'),
      ),
      body: BlocProvider<ConnectedBloc>(
        create: (context) => _connectedBloc,
        child: SingleChildScrollView(
          child: Column(
            children: [
              BlocConsumer<ConnectedBloc, ConnectedState>(
                listener: (context, state) {
                  if (state is ConnectedSucessState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Internet Connected')));
                  } else if (state is ConnectedFailureState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Internet Lost')));
                  }
                },
                builder: (context, state) {
                  if (state is ConnectedSucessState) {
                    return const Center(child: Text('Connected'));
                  } else if (state is ConnectedFailureState) {
                    return const Center(child: Text('Not Connected'));
                  } else {
                    return Container();
                  }
                },
              ),
              // Center(
              //   child: ElevatedButton(
              //     child: const Text('Open route'),
              //     onPressed: () {
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => BlocProvider(
              //             create: (context) => SigninBloc(),
              //             child: const SecondPage(),
              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // ),
              // showWeather(),
            ],
          ),
        ),
      ),
    );
  }
}
//   showWeather() {
//     return Padding(
//       padding: const EdgeInsets.all(12.0),
//       child: Column(
//         children: [
//           const Text(
//             "Search Weather",
//             style: TextStyle(
//                 fontSize: 40, fontWeight: FontWeight.w500, color: Colors.white70),
//           ),
//           const Text(
//             "Instanly",
//             style: TextStyle(
//                 fontSize: 40, fontWeight: FontWeight.w200, color: Colors.white70),
//           ),
//           const SizedBox(
//             height: 24,
//           ),
//           TextFormField(
//             decoration: const InputDecoration(
//               prefixIcon: Icon(
//                 Icons.search,
//                 color: Colors.white70,
//               ),
//               enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(10)),
//                   borderSide: BorderSide(
//                       color: Colors.white70, style: BorderStyle.solid)),
//               focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(10)),
//                   borderSide:
//                       BorderSide(color: Colors.blue, style: BorderStyle.solid)),
//               hintText: "City Name",
//               hintStyle: TextStyle(color: Colors.white70),
//             ),
//             style: const TextStyle(color: Colors.white70),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           SizedBox(
//               width: double.infinity,
//               height: 50,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     primary: Colors.lightBlue,
//                     shape: const RoundedRectangleBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(10)))),
//                 onPressed: () {},
//                 child: const Text(
//                   "Search",
//                   style: TextStyle(color: Colors.white70, fontSize: 16),
//                 ),
//               ))
//         ],
//       ),
//     );
//   }
// }

