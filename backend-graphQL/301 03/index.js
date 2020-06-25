const express = require('express');
const graphqlHTTP = require('express-graphql');
const expressPlayground = require("graphql-playground-middleware-express")

const app = express();
const prot = 55555;
let statis = "idile"

const schema = require('./schema/schema');
// bind express with graphql

app.use('/graphql', graphqlHTTP({

    schema

}));
app.use('/graphiql', graphqlHTTP({

    schema,
    graphiql: true

}));
app.get('/AIretran', (req, res) => {

    if (statis == "idile") {
        res.send('retraning')
        statis = "traning"
        const spawn = require("child_process").spawn;
        const pythonProcess = spawn('python', ["path/to/script.py"]);
        pythonProcess.stdout.on('data', (data) => {
            // Do something with the data returned from python script

            statis = "idile"
        });
    }


})

app.get('/AIStatis', (req, res) => {

    res.send(statis)

})

app.listen(prot, () => {
    console.log('now listening for requests on port ' + prot);
});



app.get('/', (req, res) => {

    if (statis == "idile") {
        res.send('retraning')
        statis = "traning"
        const spawn = require("child_process").spawn;
        const pythonProcess = spawn('python', ["path/to/script.py"]);
        pythonProcess.stdout.on('data', (data) => {
            // Do something with the data returned from python script

            statis = "idile"
        });
    }


})

app.listen(port, () => console.log(`Example app listening at http://localhost:${port}`))