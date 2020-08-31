const path = require("path");
const sqlite = require("better-sqlite3");

const db = sqlite(path.resolve(__dirname, "./concurrency.db"), {
  verbose: console.log,
});

db.exec("CREATE TABLE IF NOT EXISTS test(text VARCHAR(255))");
console.log(
  `proceso ${process.pid} empezó con`,
  db.prepare("SELECT COUNT(*) FROM test").get()
);

for (let i = 0; i < 1000; i++) {
  db.exec(`INSERT INTO \`test\` (\`text\`) VALUES ('test${i}');`);
}
console.log(
  `proceso ${process.pid} terminó con`,
  db.prepare("SELECT COUNT(*) FROM test").get()
);
