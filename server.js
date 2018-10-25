const express = require('express')
const app = express()

app.get('/', (req, res) => res.send('Sample Hosted App!'))

app.listen(3000, () => console.log('Example app listening on port 3000!'))
