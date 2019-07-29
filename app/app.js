let express = require('express');
let app = express();
const PORT = 3001;
process.env.NOME_CANDIDATO = 'leo'

app.listen(PORT);
console.log(`Aplicação teste executando em localhost: ${PORT}`);

let name = process.env.NOME_CANDIDATO || 'petlover';
app.get('/', (req, res) => {
  res.send(`Olá ${name}!`);
});
