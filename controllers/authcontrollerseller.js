import sql from '../models/db.js'
import jwt from 'jsonwebtoken'
import config from '../config.js'
export default class AuthControllerSeller {
    login = (req, res) => {
        var post = {
            password: req.body.password,
            email: req.body.email
        }

        var query = "SELECT * FROM ?? WHERE ??=? AND ??=?";

        var table = ["user", "password", post.password, "email", post.email];

        query = sql.format(query, table);
        sql.query(query, (err, rows, fields) => {

            if (err) throw err
            else {
                if (rows.length == 1) {
                    var token = jwt.sign(rows, config.secret, {
                        expiresIn: 1440

                    });


                }
                else {
                    message = "Invalid User";
                }
            }

        })
    }
    register = (req, res) => {
        let firstname = req.body.first_name;
        console.log(firstname)
        let lastname = req.body.last_name;
        let location = req.body.location;
        let username = req.body.username;
        let password = req.body.password;
        let address = req.body.address;
        let telephone = req.body.telephone;
        let email = req.body.email;
        console.log(email)
        let command = `INSERT INTO user(first_name,last_name,username,password,address,telephone,email) VALUES (?,?,?,?,?,?,?)`;
        sql.query(command, [firstname, lastname, username, password, address, telephone, email], (err, rows, fields) => {
            if (err) throw err
            res.send("new user registrations...")
        })

    }
}