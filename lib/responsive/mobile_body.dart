// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dashboard/providers/global_state.dart';

class MobileBody extends ConsumerStatefulWidget {
  MobileBody({super.key});

  @override
  ConsumerState<MobileBody> createState() => _MobileBodyState();
}

class _MobileBodyState extends ConsumerState<MobileBody> {
  
  @override
  Widget build(BuildContext context) {
    final selectedIndex = ref.watch(selectedPageProvider);
    final themeMode = ref.watch(themeModeProvider);

    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          titleSpacing: 0,  
          backgroundColor: Theme.of(context).colorScheme.surface,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/logo.png'),
                width: 50,
                height: 50,
              ),
              SizedBox(width: 10),
              Text(
                'Dashboard',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              )
            ],
          ),
          bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
              color: Colors.grey,
              height: 0.5,
          )),
          actions: [
            IconButton(
              onPressed: (){
                updateState(ref, themeModeProvider, watch(ref, themeModeProvider) == 'light' ? 'dark' : 'light');
              }, 
              icon: Icon(themeMode == 'light' ? Icons.dark_mode: Icons.light_mode)
            ),
          ],
        ),
        body: Container(
          color: Theme.of(context).colorScheme.secondary,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${pages[selectedIndex]['title']}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.tertiary),
                ),
                Text('This is the content of ${pages[selectedIndex]['title']} page', style:TextStyle(color: Theme.of(context).colorScheme.tertiary)),
              ],
            ),
          ),
        ),
        drawer: Container(
          color: Theme.of(context).colorScheme.surface,
          padding: EdgeInsets.only(top: 50),
          child: Drawer(
            backgroundColor: Theme.of(context).colorScheme.surface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(0),
                bottomRight: Radius.circular(0),
              ),
            ),
            child: ListView.builder(
                  itemCount: pages.length,
                  itemBuilder: (context,index){
                    return ListTile(
                      leading: Icon(pages[index]['icon']),
                      selected: selectedIndex == index,
                      selectedTileColor: Colors.grey.withOpacity(0.1),
                      title: Text(pages[index]['title'], style: TextStyle(fontSize: 12,color: Theme.of(context).colorScheme.tertiary)),
                      onTap: () {
                        updateState(ref, selectedPageProvider, index);
                        Navigator.pop(context);
                      },
                    );
                  },
            )),
        ));
  }
}

