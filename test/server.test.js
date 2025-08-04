const request = require('supertest');
const app = require('../server');

describe('GET / → {hello:"world"}', () => {
  it('should return JSON', async () => {
    const res = await request(app).get('/');
    expect(res.status).toBe(200);
    expect(res.body).toEqual({ hello: 'world' });
  });
});
