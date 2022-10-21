
// Packages imports

const express = require('express');
const mongoose = require('mongoose');
//Import form files 

const authRouter = require('./routes/auth');

const urldb = "mongodb+srv://henry:henry123@cluster0.qfqck0e.mongodb.net/?retryWrites=true&w=majority"
const PORT =3000;

const app = express();
//middleware
app.use(express.json());

app.use(authRouter);

mongoose.connect(urldb).then(() => {
    console.log('Connection Succesful');
}).catch((e)=>{
    console.log(e);
});

//Creating Api 


app.get('/', (req,res)=>{
    res.json({hi:"Hollo world"}) 
})

app.listen(PORT, "0.0.0.0", () =>{ console.log(`Connected at port ${PORT} ` )});