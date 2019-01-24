var mysql = require("mysql");
var inquirer = require("inquirer");

var connection = mysql.createConnection({
  host: "localhost",

  // Your port; if not 3306
  port: 8889,

  // Your username
  user: "root",

  // Your password
  password: "root",
  database: "bamazon"
});

connection.connect(function(err) {
  if (err) throw err;
  //console.log("connected as id " + connection.threadId);
  afterConnection();
});

function afterConnection() {
  readProducts();
}

function askQuestion() {
  inquirer
    .prompt([
      {
        name: "productID",
        type: "input",
        message: "What product ID would you like to buy?"
      },
      {
        name: "quantity",
        type: "input",
        message: "How many of that product do you wish to buy?"
      }
    ])
    .then(function(answer) {
      connection.query("SELECT * FROM products", function(err, res) {
        //if (err) throw err;
        if (
          parseInt(answer.quantity) > res[answer.productID - 1].stock_quantity
        ) {
          console.log("Insufficient Quantity");
          connection.end();
        } else {
          connection.query(
            "UPDATE products SET ? WHERE ?",
            [
              {
                stock_quantity:
                  res[answer.productID - 1].stock_quantity - answer.quantity
              },
              {
                item_id: answer.productID
              }
            ],
            function(err) {
              if (err) throw err;
              var totalCost = answer.quantity * res[answer.productID - 1].price;
              console.log("Your total cost is $" + totalCost.toFixed(2));
              readProducts();
            }
          );
        }
      });
    });
}

function readProducts() {
  connection.query("SELECT * FROM products", function(err, res) {
    if (err) throw err;
    console.log("ID   Product   Price   Quantity");
    for (var i = 0; i <= 9; i++) {
      console.log(
        res[i].item_id +
          "   " +
          res[i].product_name +
          "   " +
          res[i].price +
          "   " +
          res[i].stock_quantity
      );
    }
    askQuestion();
  });
}
