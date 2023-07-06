import express from 'express';
const app = express();
app.get('/', (_req, res)=>{
    res.send('we are on home');
});
app.listen(3000);