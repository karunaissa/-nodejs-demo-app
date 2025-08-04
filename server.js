const express = require('express');
const app = express();

app.get('/', (req, res) => res.json({ hello: 'world' }));

if (require.main === module) {
  const port = process.env.PORT || 3000;
  app.listen(port, () =>
    console.log(`Listening on port ${port}`)
  );
}

module.exports = app;
