const express = require('express');
const app = express();
const bodyParser = require('body-parser');
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
const mysql = require('mysql');

// MySQL connection setup
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '12345',
  database: 'st_data1'
});



connection.connect((err) => {
  if (err) {
    console.error('Error connecting to MySQL database: ', err);
    return;
  }
  console.log('Connected to MySQL database');

  
});
app.post('/addUser', (req, res) => {

  const tableName = 'users'; // Replace with your table name
  connection.query(`DESCRIBE ${tableName}`, (error, results, fields) => {
    if (error) {
      console.error('Error fetching columns:', error);
      return;
    }
    console.log('Columns:', results);
    }
    )
  const { p_name, p_email, p_password } = req.body;

  const addUserQuery = 'CALL AddUser(?, ?, ?)';

  connection.query(addUserQuery, [p_name, p_email, p_password], (error, results) => {
    if (error) {
      console.error('Error inserting user:', error);
      res.status(500).json({ error: 'Failed to add user' });
      return;
    }
    res.status(200).json({ message: 'User added successfully' });
  });
});

var loggedInUsername = '';
var userid = '';
// Route to handle user login
app.post('/login', (req, res) => {
  const { p_name, p_password } = req.body;

  // Query to check if the username and password exist in the database
  const sql = `SELECT * FROM users WHERE name = ? AND password = ?`;
  connection.query(sql, [p_name, p_password], (err, results) => {
    console.log(results);
    console.log(results[0].u_id);
    if (err) {
      console.error('Error executing query: ', err);
      res.status(500).send('Error checking credentials');
      return;
    }

    if (results.length > 0) {
      loggedInUsername = p_name;
      
      userid = results[0].u_id;
      // User found, credentials are corre;ct
      res.status(200).send('Login successful');
    } else {
      // No matching user found, credentials are incorrect
      res.status(401).send('Invalid credentials');
    }
  });
});

app.get('/loggedinuser', (req, res) => {
  console.log("this is in playlist page")
  console.log(loggedInUsername);
  res.send(loggedInUsername); // Return the logged-in username
});

app.get('/userandid', (req, res) => {
  console.log(userid);
  userdata=
    {
      "username": loggedInUsername,
      "userId": userid
    }
  
  res.send(userdata); // Return an object containing username and userId
});

app.get('/musicdata', (req, res) => {
  connection.query('SELECT * FROM tracks', (err, rows) => {
    if (err) throw err;
    res.json(rows); // Return the queried music data as JSON response
  });
});

app.get('/musicsearch', (req, res) => {
  connection.query('SELECT title FROM tracks', (err, rows) => {
    console.log(rows)
    if (err) throw err;
    res.json(rows); // Return the queried music data as JSON response
  });
});

app.get('/songdetails/:songName', (req, res) => {
  const songName = req.params.songName;
  connection.query('SELECT coverURL, song_link, song_singer FROM tracks WHERE title = ?', [songName], (err, rows) => {
    if (err) throw err;
    res.json(rows[0]); // Return the coverURL and songLink for the queried song name
  });
});

app.get('/artists', (req, res) => {
  connection.query('SELECT a_name FROM artists', (err, rows) => {
    console.log(rows)
    if (err) {
      console.error('Error fetching artists:', err);
      res.status(500).json({ error: 'Failed to fetch artists' });
      return;
    }
    res.json(rows); // Return the list of artists as JSON response
  });
});

app.get('/artists/:number', (req, res) => {
  const number = parseInt(req.params.number);
  const query = `SELECT artistName FROM artists LIMIT ${number}`; // Fetch artists based on the number

  connection.query(query, (err, results) => {
    if (err) {
      console.error('Error executing query:', err);
      res.status(500).send('Error fetching artists');
      return;
    }

    res.json(results);
  });
});

app.get('/mixedStreams', async (req, res) => {
  try {
    const count = req.query.count;
    if (!count) {
      return res.status(400).json({ error: 'Please provide a valid count parameter' });
    }

    const numberOfSongs = parseInt(count, 10);

    connection.query('SELECT title FROM mix_streams LIMIT ?', [numberOfSongs], (error, results) => {
      if (error) {
        console.error('Error fetching mixed stream songs:', error);
        res.status(500).json({ error: 'Failed to fetch mixed stream songs' });
        return;
      }

      const mixedStreamSongs = results;
      console.log(mixedStreamSongs);
      res.json(mixedStreamSongs);
    });
  } catch (error) {
    console.error('Error fetching mixed stream songs:', error);
    res.status(500).json({ error: 'Failed to fetch mixed stream songs' });
  }
});
// Update user's name
app.put('/user/:userId/updateName', (req, res) => {
  const { userId } = req.params;
  const { name } = req.body;
  console.log(name);
  console.log(userId);
  const ros = 'UPDATE users SET name = ? WHERE u_id = ?';
  connection.query(ros, [name,userId], (err, result) => {
    if (err) {
      console.error('Error updating user name:', err);
      res.status(500).json({ error: 'Error updating user name' });
      return;
    }
    res.status(200).json({ message: 'User name updated' });
    console.log("name updated");
  });
});
// Update user's password
app.put('/user/:userId/updatePassword', (req, res) => {
  const { userId } = req.params;
  const { password } = req.body;
  console.log(password);
  const query = 'UPDATE users SET password = ? WHERE u_id = ?';
  connection.query(query, [password,userId],(err, result) => {
    if (err) {
      console.error('Error updating user password:', err);
      res.status(500).json({ error: 'Error updating user password' });
      return;
    }
    res.status(200).json({ message: 'User password updated' });
    console.log("password updated");
  });
});

// Delete user
app.delete('/user/:userId/delete', (req, res) => {
  const { userId } = req.params;
  const query = `DELETE FROM users WHERE u_id = ${userId}`;
  connection.query(query, (err, result) => {
    if (err) {
      console.error('Error deleting user:', err);
      res.status(500).json({ error: 'Error deleting user' });
      return;
    }
    res.status(200).json({ message: 'User deleted' });
    console.log("user deleted");
  });
});




// Start the server
const port = 3000; // Replace with your desired port number
app.listen(port, () => {
  console.log('Server running on port',port);
});
