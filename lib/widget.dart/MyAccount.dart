import 'dart:io'; // Import this for File
import 'package:flutter/material.dart';
import 'package:food/Models/Account_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class MyAccount extends StatefulWidget {
  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  File? _imageFile;

  final ImagePicker _picker = ImagePicker();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

 @override
void initState() {
  super.initState();
  final accountModel = Provider.of<AccountModel>(context, listen: false);
  _nameController.text = accountModel.name;
  _emailController.text = accountModel.email;
  _passwordController.text = accountModel.password;
  _phoneController.text = accountModel.phone;
  _addressController.text = accountModel.address;
  if (accountModel.imagePath.isNotEmpty) {
    _imageFile = File(accountModel.imagePath);
  }
}


  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path); 
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final accountModel = Provider.of<AccountModel>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xffd8b4a7),
                Colors.white,
                Color(0xFFefe1dc),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                title: const Text(
                  'My Account',
                  style: TextStyle(
                      color: Color.fromARGB(255, 90, 56, 37),
                      fontFamily: 'Oswald'),
                ),
                backgroundColor: const Color(0xFFefe1dc),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back,
                      color: Color.fromARGB(255, 90, 56, 37)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              const SizedBox(height: 25),
              Center(
                child: Stack(
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: .5, color: const Color(0xff8e593a)),
                        color: Colors.white,
                      ),
                      child: _imageFile == null
                          ? const Icon(Icons.person,
                              size: 60, color: Color(0xff8e593a))
                          : ClipOval(
                              child: Image.file(
                                _imageFile!,
                                fit: BoxFit.cover,
                                width: 120,
                                height: 130,
                              ),
                            ),
                    ),
                    Positioned(
                      bottom: 9,
                      right: 3,
                      child: GestureDetector(
                        onTap: _pickImage,
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                width: 1, color: const Color(0xff8e593a)),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.edit,
                            size: 21,
                            color: Color(0xff8e593a),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 15),
                child: Text(
                  'Name',
                  style: TextStyle(color: Color.fromARGB(255, 90, 56, 37), fontFamily: 'Oswald', fontSize: 21),
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        width: .5, color: const Color.fromARGB(255, 90, 56, 37)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 1, left: 15),
                    child: TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        hintText: '',
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(
                          color: Color.fromARGB(255, 90, 56, 37)),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 10),
                child: Text(
                  'Email',
                  style: TextStyle(color: Color.fromARGB(255, 90, 56, 37), fontFamily: 'Oswald', fontSize: 21),
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        width: .5, color: const Color.fromARGB(255, 90, 56, 37)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 1, left: 15),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        hintText: '',
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(color: Color.fromARGB(255, 90, 56, 37)),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 10),
                child: Text(
                  'Password',
                  style: TextStyle(color: Color.fromARGB(255, 90, 56, 37), fontFamily: 'Oswald', fontSize: 21),
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: .5, color: const Color.fromARGB(255, 90, 56, 37)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 1, left: 15),
                    child: TextFormField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        hintText: '',
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(color: Color.fromARGB(255, 90, 56, 37)),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 10),
                child: Text(
                  'Phone',
                  style: TextStyle(color: Color.fromARGB(255, 90, 56, 37), fontFamily: 'Oswald', fontSize: 21),
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: .5, color: const Color.fromARGB(255, 90, 56, 37)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 1, left: 15),
                    child: TextFormField(
                      controller: _phoneController,
                      decoration: const InputDecoration(
                        hintText: '',
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(color: Color.fromARGB(255, 90, 56, 37)),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 10),
                child: Text(
                  'Address',
                  style: TextStyle(color: Color.fromARGB(255, 90, 56, 37), fontFamily: 'Oswald', fontSize: 21),
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: .5, color: const Color.fromARGB(255, 90, 56, 37)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 1, left: 15),
                    child: TextFormField(
                      controller: _addressController,
                      decoration: const InputDecoration(
                        hintText: '',
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(color: Color.fromARGB(255, 90, 56, 37)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: GestureDetector(
                  onTap: () {
                    accountModel.updateAccount(
                      _nameController.text,
                      _emailController.text,
                      _passwordController.text,
                      _phoneController.text,
                      _addressController.text,
                      _imageFile?.path ?? '',
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Account updated successfully')),
                    );
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xff8e593a),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        'Save Update',
                        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
