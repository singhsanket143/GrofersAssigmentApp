# MultiNote
An amazing notes app that can help you keep a track of your notes and essential tasks.

The app is a Ruby On Rails based web application

## Features Implemented

- Addition/Deletion/Updation of Notes
- Information stored about notes
  - Title
  - Label
  - Content
- Addition of Admin Panel  
- Filtering on the basis of Label
- Filtering on the basis of Date
- Searching the notes based on substring matching
- Support for 9 different tags - Medium Priority, Non-critical, Work, Trackback, Family, Deadline, In Progress, Important,    Priority 
- User Authentication
- Validation on the naming of the notes
- Support for Markdown
- Link Highlighting
- Smooth Scroll

## Installation

Follow the steps below to run the project. 

1. Clone the Repository
```
$ git clone https://github.com/riyabansal98/GrofersNotesApp.git
```
2. Install the gems
```
$ bundle install
```
3. To set up the tables in the database
```
$ rake db:migrate
```
4. We always have default data that we want to have in our application for testing purposes. The seed command exists to automate this process. To do that use, 
```
$ rake db:seed
```
5. Run  the rails server using the command line simply using,
```
$ rails server
```

7. Run the application on http://localhost:3000/

## Functionalities

### Admin Panel
The main purpose of Admin Panel is to add/remove the labels to the notes and keep a track of the current users of the app.

![image](https://user-images.githubusercontent.com/29747452/71582248-476cee80-2b2f-11ea-9ba2-535366646281.png)


### View all the Notes:
Each note can be viewed, edited and deleted depending on the requirements of the user. 

![Screenshot 2019-12-30 at 7 58 35 PM](https://user-images.githubusercontent.com/29747452/71586057-d1708380-2b3e-11ea-8001-efc77533867a.png)

### Label Filtering on Notes:
The notes can be filtered on the basis of label assigned to them. Simply write the name of the required tag and press Apply Filters. The required notes will be displayed.
Eg: Display the notes which have the tag **Deadline**.

![Screenshot 2019-12-30 at 8 04 18 PM](https://user-images.githubusercontent.com/29747452/71586555-a2f3a800-2b40-11ea-8821-c58db3edc36b.png)

### Notes Filtering on the basis of Date
In order to filter the notes, on the basis of date, write the start date and the end date and press Apply Filters. 

![Screenshot 2019-12-30 at 8 30 25 PM](https://user-images.githubusercontent.com/29747452/71587358-5cec1380-2b43-11ea-90c9-9a9b3952fcd3.png)
### Searching in Notes

Notes can be searched on the basis of the substring. Write the name of the notes you want to in the search bar and press the button search. 

![Screenshot 2019-12-30 at 8 18 24 PM](https://user-images.githubusercontent.com/29747452/71586880-a3d90980-2b41-11ea-98ed-f29337236c20.png)


### New Notes Page: 
To add a new note click on Create new note. Add the title and the description of the note. You can also add labels such as Medium Priority, Non-critical, Work, Trackback, Family, Deadline, In Progress, Important, Priority 

![Screenshot 2019-12-30 at 6 11 24 PM](https://user-images.githubusercontent.com/29747452/71582362-de39ab00-2b2f-11ea-963d-10b9a96ad3bb.png)

### Edit a note:

To edit a note, simply click on the edit note button corresponding to the note that you want to edit. 

![Screenshot 2019-12-30 at 8 12 45 PM](https://user-images.githubusercontent.com/29747452/71586589-c6b6ee00-2b40-11ea-9774-59bcc3b23a9e.png)


### Display a Note:
To view a particular note, click on the button View Note 

![Screenshot 2019-12-30 at 8 14 26 PM](https://user-images.githubusercontent.com/29747452/71586726-31682980-2b41-11ea-9915-49a31ee11280.png)

### User Authentication:

![Screenshot 2019-12-30 at 8 20 10 PM](https://user-images.githubusercontent.com/29747452/71586930-d420a800-2b41-11ea-91b3-34456d78860f.png)

### Markdown Support

![Screenshot 2019-12-30 at 8 42 32 PM](https://user-images.githubusercontent.com/29747452/71587760-f9fb7c00-2b44-11ea-9454-2ed5738ff543.png)
