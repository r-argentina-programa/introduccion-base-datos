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
  console.log(`${pid} empezó con ${contents.length} registros.`);
  let lastIndex = contents[contents.length - 1].index;

  console.log(`Escribiendo data en ${pid}`);
  for (let i = 0; i < 1000; i++) {
    contents.push({ index: ++lastIndex });
    fs.writeFileSync(file, JSON.stringify(contents), () => {});
  }

  const newData = fs.readFileSync(file, "utf8");
  console.log(`${pid} terminó con ${JSON.parse(newData).length} registros.`);
} catch (e) {
  console.error("error", e);
  console.error("la data erronea es", data);
}
