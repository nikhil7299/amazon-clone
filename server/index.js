//IMPORT FROM PACKAGES
const express = require("express");
const mongoose = require("mongoose");


//IMPORT FROM OTHER FILES
const authRouter = require("./routes/auth");
const adminRouter = require("./routes/admin");
const productRouter = require("./routes/product");


//INIT
const app = express();
const PORT = process.env.PORT || 3000;
const DB = "mongodb+srv://nikhil:nikhil123@cluster0.04rxyxu.mongodb.net/test";
//^URI



//?MIDDLEWARE
//CLIENT -> middleware -> SERVER -> CLIENT
//  not continuous listening, for continuous listening we need socket IO for real time communication
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);

//Connections
mongoose.connect(DB).then(() => {
    console.log('Connection Successful');
}).catch((e) => {
    console.log(e);
});


app.listen(PORT, "0.0.0.0", () => {
    console.log(`connected at port ${PORT}`);
});