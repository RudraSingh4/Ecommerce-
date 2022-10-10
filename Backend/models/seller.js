import sql from './db.js'


export default class Seller {
    myproducts = function (req) {
        return new Promise(resolve => {
            let username = req.body.supplier_username;
            let command = "SELECT * FROM products";
            sql.query(command, (err, rows, fields) => {
                console.log(rows)
                console.log(rows.length)
                let result = []
                for (let i = 0; i < rows.length; i++) {
                    if (username === rows[i].supplier_username) {
                        result.push(rows[i])



                    }

                }
                resolve(result);
            })
        })
    };





    insert = function (req) {
        return new Promise(resolve => {
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
            let command = `INSERT INTO products(first_name,last_name,username,password,address,telephone,email) VALUES (?,?,?,?,?,?,?)`;
            sql.query(command, [firstname, lastname, username, password, address, telephone, email], (err, rows, fields) => {
                if (err) throw err
                resolve(rows);
            })
        })
    }

    remove = function (id) {
        return new Promise(resolve => {
            let command = "DELETE FROM user Where id=" + id;
            sql.query(command, (err, rows, fields) => {
                resolve(rows);
            })
        })
    }
    edit = function (req) {
        return new Promise(resolve => {
            var id = req.body.id
            var name = req.body.Product_name
            let user = "select * from products";
            sql.query(user, (err, rows, fields) => {
                let see = rows.find((person) => (person.id === id))
                console.log(see)
                if (rows.find((person) => (person.id === parseInt(id)))) {

                    let command = `UPDATE products SET Product_name = ? WHERE id= ?`;
                    let data = [name, id]
                    sql.query(command, data, (err, rows, fields) => {
                        if (err) throw err
                        resolve(rows)
                    })

                }

            });

        })
    }
}
