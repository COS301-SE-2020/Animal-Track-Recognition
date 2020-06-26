const express = require('express');
const graphqlHTTP = require('express-graphql');
const expressPlayground = require("graphql-playground-middleware-express")

const app = express();
const port = 55556;
let status = "idle"

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

    if (status == "idle") {
        status = "training"

        const {
            spawn
        } = require('child_process');
        const pyProg = spawn('python', ['./fileReader.py']);

        pyProg.stdout.on('data', function (data) {

            if (  data.toString().startsWith("charizard")){
            console.log(data.toString());
            res.write(data);
            res.end('end');
            status = "idle";
            pyProg.end;
            }
            else{
                console.log(data.toString());
            }

            
        });


        
    }


})

app.get('/AIstatus', (req, res) => {

    res.send(status)

})

app.listen(port, () => {
    console.log('now listening for requests on port ' + port);
    console.log(`Example app listening at http://localhost:${port}`);
});