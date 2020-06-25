const express = require('express');
const graphqlHTTP = require('express-graphql');
const expressPlayground = require("graphql-playground-middleware-express")

const app = express();
const prot =4000;

const schema = require('./schema/schema');
// bind express with graphql

app.use('/graphql', graphqlHTTP({

    schema

}));
app.use('/graphiql', graphqlHTTP({

    schema,
    graphiql:true

}));
app.listen(prot, () => {
    console.log('now listening for requests on port '+prot);
});

