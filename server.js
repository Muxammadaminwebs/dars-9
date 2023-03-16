const pg = require("pg");
const { Pool } = pg;
const pool = new Pool({
  user: "postgres",
  port: 5432,
  database: "lesson9",
  host: "localhost",
  password: "11",
});

async function fetch() {
  const cleint = await pool.connect();
  try {
    const {
      rows: [data],
    } = await cleint.query(
      "select * from cars where price = $1 and car_model = $2",
      [6780, "Damas"]
    );
    console.log(data);
  } catch (err) {
    console.log(err.message);
  } finally {
    console.log("ok");
  }
}
async function fetchAll() {
  const cleint = await pool.connect();
  try {
    const { rows } = await cleint.query("select * from cars");
    console.log(rows);
  } catch (err) {
    console.log(err.message);
  } finally {
    console.log("ok");
  }
}

fetch();
fetchAll();
