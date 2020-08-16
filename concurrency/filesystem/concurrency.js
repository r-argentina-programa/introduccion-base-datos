const fs = require("fs");
const path = require("path");

const file = path.resolve(__dirname, "./concurrency_result.json");

const { pid } = process;

console.log(`Leyendo data en ${pid}`);

const data = fs.readFileSync(file, "utf8");

if (data === "") {
  console.error(`no se pudo leer data en ${pid}`);
  process.exit(0);
}

try {
  console.log(`Parseando data en ${pid}`);
  const contents = JSON.parse(data);
  let lastIndex = contents[contents.length - 1].index;

  console.log(`Escribiendo data en ${pid}`);
  for (let i = 0; i < 1000; i++) {
    contents.push({ index: ++lastIndex });
    fs.writeFileSync(file, JSON.stringify(contents), () => {});
  }
} catch (e) {
  console.error("error", e);
  console.error("la data erronea es", data);
}
