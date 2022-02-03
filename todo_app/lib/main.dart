import 'package:flutter/material.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/todo.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ToDo(),
    ),
  );
}

class ToDo extends StatefulWidget {
  const ToDo({Key? key}) : super(key: key);

  @override
  _ToDoState createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  TextEditingController _controller = TextEditingController();
  String todoText = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          'TODO',
          style: TextStyle(
              fontFamily: 'KaushanScript-Regular', fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ToDoList(),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: kPrimaryColor, width: 2.0),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        onChanged: (value) {
                          todoText = value;
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          hintText: 'Type your TODO here...',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          todoListData.add(todoText);
                          todoText = "";
                          _controller.clear();
                        });
                      },
                      child: Text(
                        '+',
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ToDoList extends StatelessWidget {
  const ToDoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      child: ListView.separated(
        itemCount: todoListData.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todoListData[index]),
            trailing: DeleteButton(index: index,)
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            thickness: 2,
          );
        },
      ),
    );
  }
}

class DeleteButton extends StatefulWidget {
  final int index;
  DeleteButton({required this.index});

  @override
  _DeleteButtonState createState() => _DeleteButtonState();
}

class _DeleteButtonState extends State<DeleteButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){
        todoListData.removeAt(widget.index);
        setState(() {

        });
      },
      icon: Icon(Icons.close,
        color: kPrimaryColor,
      ),
    );
  }
}

