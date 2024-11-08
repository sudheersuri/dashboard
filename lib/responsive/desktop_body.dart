// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dashboard/providers/global_state.dart';

class DesktopBody extends ConsumerStatefulWidget{
  DesktopBody({super.key});

  @override
  ConsumerState<DesktopBody> createState() => _DesktopBodyState();
}

class _DesktopBodyState extends ConsumerState<DesktopBody> {
  
  @override
  Widget build(BuildContext context) {

    final selectedIndex = ref.watch(selectedPageProvider);
    final themeMode = ref.watch(themeModeProvider);
    
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return  Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey.withOpacity(0.5),
                      width: 1,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage('assets/logo.png'),
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
                    IconButton(onPressed: (){
                      updateState(ref, themeModeProvider, themeMode == 'light' ? 'dark' : 'light');
                    }, icon: Icon(themeMode == 'light' ? Icons.dark_mode: Icons.light_mode)),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start, 
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: constraints.maxWidth * 0.2,
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            color: Colors.grey.withOpacity(0.5),
                            width: 1,
                          ),
                        ),
                      ),
                      child: ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: pages.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: Icon(pages[index]['icon']),
                                  selected: selectedIndex == index,
                                  selectedTileColor: selectedIndex == index ? Colors.grey.withOpacity(0.1) : Colors.white,
                                  title: Text(pages[index]['title'], style: TextStyle(fontSize: 12)),
                                  onTap: () {
                                    updateState(ref, selectedPageProvider, index);
                                  },
                                );
                              },       
                      )
                      ),
                    Container(
                      width: constraints.maxWidth * 0.8,
                      color: Theme.of(context).colorScheme.secondary, 
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(pages[selectedIndex]['title'], style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color:Theme.of(context).colorScheme.tertiary,
                            )),
                            const SizedBox(height: 10),
                            Text('This is the content of ${pages[selectedIndex]['title']} page',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.tertiary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
        
       ),
    );
  }
}
