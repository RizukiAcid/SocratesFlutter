# Code Citations

## License: unknown
https://github.com/indmind/dts-praktik2/tree/8d0c7101b1a47fee0c96c06365d3c47eae620e50/lib/pages/home_page.dart

```
(BuildContext context) {
              return {'Menu 1', 'Menu 2', 'Menu 3'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList()
```


## License: unknown
https://github.com/bobby-bose/flutter_lcc_api_handling/tree/a656677d8e0b30a5d6d8ea2e85e53f47b95e59dc/sqliiftee/lib/main.dart

```
EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null ||
```


## License: unknown
https://github.com/Connacri/ramzy/tree/adb74fab2737f3b7395a79192e3ef910c8b350f0/lib/food/addFood.dart

```
}
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null
```


## License: unknown
https://github.com/itheaks/CodSoft/tree/991c9435f048b89ddf568d467dc02600ebb01af3/todo/lib/main.dart

```
,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration:
```


## License: unknown
https://github.com/SydneySoita/Auth-django-flutter/tree/8efb3fd4303fd5a04ba3585191b4f74cf161c7b0/authfrontend/lib/update_expense.dart

```
: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value
```

