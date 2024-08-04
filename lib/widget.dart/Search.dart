import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(27),
          border: Border.all(width: .4, color: Colors.grey),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Row(
            children: [
              Icon(Icons.search, color: Color(0xff8e593a), size: 24),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'What would you like to eat ?',
                      border: InputBorder.none,
                    ),
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              Icon(Icons.filter_list, color: Color(0xff8e593a), size: 24,),
            ],
          ),
        ),
      ),
    );
  }
}
